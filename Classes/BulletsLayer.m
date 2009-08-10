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

#define kFirstBullet 50

enum {
	kTagPlayerBulletSprite = 1,
	kTagEnemyBulletSprite = 2,
};

@implementation BulletsLayer

@synthesize numPlayerBullets;

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init] )) {
		self.isTouchEnabled = NO;
	
		AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:2];
		[self addChild:mgr z:0 tag:kTagSpriteManager];

		numPlayerBullets = 0;
	}

	return self;
}


- (void) dealloc
{
	[super dealloc];
}


-(void) addPlayerBullet:(CGPoint) pos andCharge:(int) charge
{
	numPlayerBullets++;

	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
	AtlasSprite *playerBulletSprite = (AtlasSprite *)[AtlasSprite spriteWithRect:CGRectMake(0,0,8,8) spriteManager:mgr];
	playerBulletSprite.position = pos;
	[mgr addChild:playerBulletSprite z:0 tag:(kFirstBullet + numPlayerBullets)];

	[self schedule: @selector(moveBullet:) interval:0];
}

-(void) addEnemyBullet:(CGPoint) pos andCharge:(int) charge
{
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
	AtlasSprite *enemyBulletSprite = (AtlasSprite *)[AtlasSprite spriteWithRect:CGRectMake(8,0,8,8) spriteManager:mgr];
	enemyBulletSprite.position = pos;
	[mgr addChild:enemyBulletSprite z:0];
}

-(void) moveBullet: (ccTime) dt
{
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];

	for (int i = 1; i < numPlayerBullets + 1; i++) {
		AtlasSprite *playerBulletSprite = (AtlasSprite *)[mgr getChildByTag:(kFirstBullet + i) ];
		playerBulletSprite.position = CGPointMake(playerBulletSprite.position.x, playerBulletSprite.position.y + 2);
	}
}

@end
