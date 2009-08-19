//
//  BulletsLayer.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "BulletsLayer.h"
#import "defines.h"
#import "PlayerBulletSprite.h"

#define kTagSpriteManager 1

enum {
	kTagPlayerBulletSprite = 1,
	kTagEnemyBulletSprite = 2,
};

@implementation BulletsLayer

@synthesize onScreenPlayerBullets;

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = NO;
	
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:2];
	[self addChild:mgr z:0 tag:kTagSpriteManager];
	
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
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    PlayerBulletSprite *playerBulletSprite = [PlayerBulletSprite initWithCharge:charge spriteManager:mgr];
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
	PlayerBulletSprite *playerBulletSprite = [onScreenPlayerBullets objectAtIndex:i];

	playerBulletSprite.position = CGPointMake(playerBulletSprite.position.x, playerBulletSprite.position.y + kPlayerBulletMovementSpeed);

	// is this dangerous?
 	if (s.height < playerBulletSprite.position.y)
	    [self removePlayerBullet: playerBulletSprite];
    }
}

-(void) removePlayerBullet: (PlayerBulletSprite *) bulletSprite
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    [onScreenPlayerBullets removeObject: bulletSprite];
    [mgr removeChild: bulletSprite cleanup:YES];
}

@end
