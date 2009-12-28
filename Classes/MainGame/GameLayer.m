//
//  GameLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "Player.h"

enum {
    kTagSpriteManager = 1,
    kTagPlayer = 2,
};

@implementation GameLayer

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:1];
	[self addChild:mgr z:0 tag:kTagSpriteManager];
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

-(Player *) createPlayer
{
    AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
    Player *player = [Player spriteWithRect:CGRectMake(0,0,16,16) spriteManager:mgr];
    player.position = ccp(100, 150);
    [mgr addChild:player z:0 tag:kTagPlayer];
    return player;
}

@end
