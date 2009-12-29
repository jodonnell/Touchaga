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

@implementation GameLayer

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
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

    if (!mgr) {
	AtlasSpriteManager *mgr = [[sprite getSpriteManager] getManager];
//	[self addChild:mgr z:[[sprite spriteManager] zIndex] tag:[[sprite spriteManager] tag]];
//	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:1];
	[self addChild:mgr z:0 tag:0];
    }

    [mgr addChild:sprite];
}

@end
