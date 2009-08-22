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

@synthesize playerBullets;

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = NO;
	
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:2];
	[self addChild:mgr z:0 tag:kTagSpriteManager];
	
	playerBullets = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) dealloc
{
    [playerBullets release];
    [super dealloc];
}

-(void) addPlayerBullet:(CGPoint) pos andCharge:(int) charge
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    PlayerBulletSprite *playerBulletSprite = [PlayerBulletSprite initWithCharge:charge spriteManager:mgr];
    playerBulletSprite.position = pos;
    [mgr addChild:playerBulletSprite z:0];
    
    [playerBullets addObject: playerBulletSprite];

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
    for (int i = 0; i < [playerBullets count]; i++) 
    {
	PlayerBulletSprite *playerBulletSprite = [playerBullets objectAtIndex:i];

	playerBulletSprite.position = CGPointMake(playerBulletSprite.position.x, playerBulletSprite.position.y + kPlayerBulletMovementSpeed);

	// is this dangerous?
 	if (s.height < playerBulletSprite.position.y)
	    [self removePlayerBullet: playerBulletSprite];
    }
}

-(void) removePlayerBullet: (PlayerBulletSprite *) bulletSprite
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    [playerBullets removeObject: bulletSprite];
    [mgr removeChild: bulletSprite cleanup:YES];
}

@end
