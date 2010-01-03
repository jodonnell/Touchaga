//
//  GameLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "Player.h"
#import "TouchagaSprite.h"
#import "SpriteManager.h"

@implementation GameLayer

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
	PlayerSpriteManager *playerManager = [[PlayerSpriteManager alloc] init];
	PlayerBulletSpriteManager *bulletManager = [[PlayerBulletSpriteManager alloc] init];
	[self addChild:playerManager.manager z:[playerManager zIndex] tag:[playerManager tag]];
	[self addChild:bulletManager.manager z:[bulletManager zIndex] tag:[bulletManager tag]];
	
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

-(void) addSpriteToLayer:(TouchagaSprite *) sprite
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag:[[sprite spriteManager] tag]];
    [mgr addChild:sprite];
}

-(void) removePlayerBullet: (PlayerBullet *) playerBullet
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag:[[playerBullet spriteManager] tag]];
    [mgr removeChild:(TouchagaSprite *)playerBullet cleanup:YES];
}

-(void) addChildLayer:(Layer *) layer
{
    [self addChild:layer z:0 tag:93];
}

@end
