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

@end
