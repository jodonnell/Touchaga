//
//  BulletsLayer.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BulletsLayer.h"
#import "defines.h"

#define kTagSpriteManager 1

enum {
	kTagPlayerBulletSprite = 1,
	kTagEnemyBulletSprite = 2,
};

@implementation BulletsLayer

@synthesize numPlayerBullets;
@synthesize onScreenPlayerBullets;

// on "init" you need to initialize your instance
-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = NO;
	
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:2];
	[self addChild:mgr z:0 tag:kTagSpriteManager];
	
	numPlayerBullets = 0;
	onScreenPlayerBullets = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (void) dealloc
{
    [onScreenPlayerBullets release];
    [super dealloc];
}


-(void) addPlayerBullet:(CGPoint) pos andCharge:(int) charge
{
    numPlayerBullets++;

    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    AtlasSprite *playerBulletSprite = [AtlasSprite spriteWithRect:CGRectMake(0,0,8,8) spriteManager:mgr];
    playerBulletSprite.position = pos;
    [mgr addChild:playerBulletSprite z:0];
    
    [onScreenPlayerBullets addObject: playerBulletSprite];

    [self schedule: @selector(moveBullet:) interval:0];
}

-(void) addEnemyBullet:(CGPoint) pos andCharge:(int) charge
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    AtlasSprite *enemyBulletSprite = [AtlasSprite spriteWithRect:CGRectMake(8,0,8,8) spriteManager:mgr];
    enemyBulletSprite.position = pos;
    [mgr addChild:enemyBulletSprite z:0];
}

-(void) moveBullet: (ccTime) dt
{
    CGSize s = [[Director sharedDirector] winSize];

    // asserts that the bullets go offscreen in the same order they were created
    for (int i = 0; i < [onScreenPlayerBullets count]; i++) 
    {
	AtlasSprite *playerBulletSprite = (AtlasSprite *)[onScreenPlayerBullets objectAtIndex:i];

	playerBulletSprite.position = CGPointMake(playerBulletSprite.position.x, playerBulletSprite.position.y + 2);

 	if (s.height < playerBulletSprite.position.y)
	    [self removePlayerBullet: playerBulletSprite];
    }
}

-(void) removePlayerBullet: (AtlasSprite *) bulletSprite
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    [onScreenPlayerBullets removeObject: bulletSprite];
    [mgr removeChild: bulletSprite cleanup:YES];
}

@end
