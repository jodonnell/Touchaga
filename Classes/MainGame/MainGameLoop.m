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

#import "PlayerInactiveLayer.h"

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
 	[gameLayer addSpriteToLayer:player];

	PlayerInactiveLayer *playerInactiveLayer =  [[PlayerInactiveLayer alloc] initWithPlayer: player];
	[gameLayer addChild: (Layer *)playerInactiveLayer];

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
    if ([self isShooting])
	[self shootBullet];

    [self updatePlayerBullets];

    if ([player warpPlayerOut])
	[self warpPlayerOut];

    if ([player isWarpedOut])
	[self drainPlayerWarpEnergy];

    if ([self isPlayerWarpingIn])
	[self warpPlayerIn];

//    if  [player isOutOfWarpEnergy]
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

// PRIVATE
-(BOOL) isShooting
{
    return [shootButtonLayer isShooting] && [player isWarpedOut] == NO;
}

-(void) shootBullet
{
    PlayerBullet *playerBullet = (PlayerBullet *)[player shoot];
    [playerBullet moveTo:player.position];
    [gameLayer addSpriteToLayer:playerBullet];

    [playerBullets addObject: playerBullet];
}

-(void) updatePlayerBullets
{
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
}

-(void) warpPlayerOut
{
    warpLayer = [player warpOut];
    [gameLayer addChild: (Layer *)warpLayer];
}

-(void) drainPlayerWarpEnergy
{
    [warpLayer drainEnergy];
}

-(BOOL) isPlayerWarpingIn
{
    return warpLayer != nil && ([warpLayer warpIn]);
}

-(void) warpPlayerIn
{
    [gameLayer removeChild: (Layer *)warpLayer cleanup:YES];
    [warpLayer release];
    warpLayer = nil;
}

@end
