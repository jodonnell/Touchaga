//
//  MainGameLoop.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainGameLoop.h"
#import "GameLayer.h"
#import "ShootButtonLayer.h"
#import "Player.h"
#import "TouchagaSprite.h"

@implementation MainGameLoop

@synthesize gameLayer;
@synthesize player;
@synthesize shootButtonLayer;

-(id) init
{
    if( (self=[super init] )) {
	gameLayer = [[GameLayer alloc] init];
	shootButtonLayer = [[ShootButtonLayer alloc] init];

 	player = [[Player alloc] init];
 	[player moveTo:ccp(100, 150)];
 	[gameLayer addSpriteToLayer:player];

	[self schedule:@selector(update:)];
    }
    
    return self;
}

-(void) dealloc
{
    [gameLayer release];
    [player release];
    [shootButtonLayer release];

    [super dealloc];
}

-(void) update: (ccTime) dt
{
    if ([shootButtonLayer isShooting]) {
	TouchagaSprite *playerBullet = (TouchagaSprite *)[player shoot];
	[gameLayer addSpriteToLayer:playerBullet];
    }
}

-(GameLayer *) getGameLayer
{
    return gameLayer;
}

-(ShootButtonLayer *) getShootButtonLayer
{
    return shootButtonLayer;
}

@end
