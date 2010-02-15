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
#import "PlayerInactiveLayer.h"
#import "Enemy.h"

@implementation GameLayer

#define INACTIVE_LAYER_TAG 100
#define HIGHEST_Z_VALUE 4


+(GameLayer *)sharedInstance
{
    static GameLayer *myInstance = nil;
 
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
    }

    return myInstance;
}

-(id) init
{
    if( (self=[super init] )) {
        PlayerSpriteManager *playerManager = [[PlayerSpriteManager alloc] init];
        PlayerBulletSpriteManager *bulletManager = [[PlayerBulletSpriteManager alloc] init];
        WarpOutSpriteManager *warpOutManager = [[WarpOutSpriteManager alloc] init];
        BackgroundSpriteManager *backgroundMangaer = [[BackgroundSpriteManager alloc] init];
        EnemySpriteManager *enemyManager = [[EnemySpriteManager alloc] init];
        [self addChild:playerManager.manager z:[playerManager zIndex] tag:[playerManager tag]];
        [self addChild:bulletManager.manager z:[bulletManager zIndex] tag:[bulletManager tag]];
        [self addChild:warpOutManager.manager z:[warpOutManager zIndex] tag:[warpOutManager tag]];
        [self addChild:backgroundMangaer.manager z:[backgroundMangaer zIndex] tag:[backgroundMangaer tag]];
        [self addChild:enemyManager.manager z:[enemyManager zIndex] tag:[enemyManager tag]];

        [playerManager release];
        [bulletManager release];
        [warpOutManager release];
        [backgroundMangaer release];
        [enemyManager release];
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

-(void) removeEnemy: (Enemy *) enemy
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag:[[enemy spriteManager] tag]];
    [mgr removeChild:(TouchagaSprite *)enemy cleanup:YES];
}

-(void) removeWarpOutCircle: (WarpOutCircle *) warpOutCircle
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag:[[warpOutCircle spriteManager] tag]];
    if (mgr)
        [mgr removeChild:(TouchagaSprite *)warpOutCircle cleanup:YES];
}

-(void) removeInactiveLayer: (PlayerInactiveLayer *) inactiveLayer
{
    if ([self getChildByTag:INACTIVE_LAYER_TAG])
        [self removeChild:(Layer *)inactiveLayer cleanup:YES];
}

-(void) addInactiveLayer: (PlayerInactiveLayer *) inactiveLayer
{
    [[GameLayer sharedInstance] addChild:(Layer *)inactiveLayer z:HIGHEST_Z_VALUE tag:INACTIVE_LAYER_TAG];
}

-(BOOL) isInactiveLayerOn
{
    if ([self getChildByTag:INACTIVE_LAYER_TAG])
        return YES;
    return NO;
}

@end
