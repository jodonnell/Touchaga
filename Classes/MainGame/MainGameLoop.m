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
#import "PlayerBullet.h"
#import "WarpLayer.h"

@implementation MainGameLoop

@synthesize gameLayer;
@synthesize player;
@synthesize shootButtonLayer;
@synthesize playerBullets;
@synthesize warpLayer;

-(id) init
{
    if( (self=[super init] )) {
	playerBullets = [[NSMutableArray alloc] init];

	gameLayer = [[GameLayer alloc] init];
	shootButtonLayer = [[ShootButtonLayer alloc] init];
	warpLayer = nil;

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
    [playerBullets release];
    
    [super dealloc];
}

-(void) update: (ccTime) dt
{
    if ([shootButtonLayer isShooting] && [player isWarpedOut] == NO) {
	PlayerBullet *playerBullet = (PlayerBullet *)[player shoot];
	[playerBullet moveTo:player.position];
	[gameLayer addSpriteToLayer:playerBullet];

	[playerBullets addObject: playerBullet];
    }

    if ([playerBullets count]) {
	for (int i = 0; i < [playerBullets count]; i++) 
	{
	    PlayerBullet *playerBullet = [playerBullets objectAtIndex:i];
	    [playerBullet update];
	    if ([playerBullet isOffScreen]) {
		[self removePlayerBullet: playerBullet];
	    }
	}
    }
    
    if ([player warpPlayerOut]) {
	warpLayer = [player warpOut];
	[gameLayer addChild: (Layer *)warpLayer];
    }
    
    if ([player isWarpedOut])
	[warpLayer drainEnergy];

    if (warpLayer != nil && ([warpLayer warpIn] || [player isOutOfWarpEnergy])) {
	[gameLayer removeChild: (Layer *)warpLayer cleanup:YES];
	[warpLayer release];
	warpLayer = nil;
    }
	
}

-(void) removePlayerBullet: (PlayerBullet *) playerBullet
{
    [gameLayer removePlayerBullet:playerBullet];
    [playerBullets removeObject: playerBullet];
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
