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
#import "WarpOutCircle.h"

@implementation GameLayer

-(id) init
{
    if( (self=[super init] )) {
	PlayerSpriteManager *playerManager = [[PlayerSpriteManager alloc] init];
	PlayerBulletSpriteManager *bulletManager = [[PlayerBulletSpriteManager alloc] init];
	WarpOutSpriteManager *warpOutManager = [[WarpOutSpriteManager alloc] init];
	BackgroundSpriteManager *backgroundMangaer = [[BackgroundSpriteManager alloc] init];
	[self addChild:playerManager.manager z:[playerManager zIndex] tag:[playerManager tag]];
	[self addChild:bulletManager.manager z:[bulletManager zIndex] tag:[bulletManager tag]];
	[self addChild:warpOutManager.manager z:[warpOutManager zIndex] tag:[warpOutManager tag]];
	[self addChild:backgroundMangaer.manager z:[backgroundMangaer zIndex] tag:[backgroundMangaer tag]];
	
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

-(void) removeWarpOutCircle: (WarpOutCircle *) warpOutCircle
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag:[[warpOutCircle spriteManager] tag]];
    [mgr removeChild:(TouchagaSprite *)warpOutCircle cleanup:YES];
}

@end
