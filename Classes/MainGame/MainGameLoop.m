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
#import "WarpOutCircle.h"
#import "WarpEnergy.h"
#import "Background.h"

#import "PlayerInactiveLayer.h"

#define HIGHEST_Z_VALUE 4

@interface MainGameLoop()

/** 
 * Updates all PlayerBullets, moves them up the screen and checks for collisions.
 */
-(void) updatePlayerBullets;

/** 
 * Shoots a player bullet.
 */
-(void) shootBullet;

/** 
 * Warps the player out, adds the warp out circle to the game layer.
 */
-(void) warpPlayerOut;

/** 
 * Drains the player warp out energy if warped out.
 */
-(void) drainPlayerWarpEnergy;

/** 
 * Warps the player back in.
 */
-(void) warpPlayerIn;

/** 
 * Checks to see if the player is warping in.
 * @return YES if the player is warping in.
 */
-(BOOL) isPlayerWarpingIn;

/** 
 * Checks to see if the player is shooting.
 * @return YES if the player is shooting.
 */
-(BOOL) isShooting;

/** 
 * Draws the warp meter on to the MainGameLoop node.
 */
-(void) drawWarpMeter;
@end

@implementation MainGameLoop

@synthesize gameLayer;
@synthesize player;
@synthesize shootButtonLayer;
@synthesize playerBullets;
@synthesize warpOutCircle;
@synthesize playerInactiveLayer;
@synthesize background;

-(id) init
{
    if( (self=[super init] )) {
	playerBullets = [[NSMutableArray alloc] init];

	gameLayer = [[GameLayer alloc] init];
	shootButtonLayer = [[ShootButtonLayer alloc] init];
	warpOutCircle = nil;

 	player = [[Player alloc] init];
 	[gameLayer addSpriteToLayer:player];

	playerInactiveLayer =  [[PlayerInactiveLayer alloc] initWithPlayer: player];
	[gameLayer addChild:(Layer *)playerInactiveLayer z:HIGHEST_Z_VALUE];

 	background = [[Background alloc] init];
 	[gameLayer addSpriteToLayer:background];

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
    [playerInactiveLayer release];
    [background release];

    [super dealloc];
}

-(void) update: (ccTime) dt
{
    if ([self isShooting])
	[self shootBullet];

    [self updatePlayerBullets];

    if ([player warpPlayerOut])
	[self warpPlayerOut];

    if ([player isWarpedOut]) {
	[self drainPlayerWarpEnergy];
	[warpOutCircle update];
    }

    if ([self isPlayerWarpingIn])
	[self warpPlayerIn];

    if (playerInactiveLayer != nil && [playerInactiveLayer warpIn])
	[self warpPlayerIn];


//    if  [player isOutOfWarpEnergy]
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
    [playerBullet release];
}

-(void) updatePlayerBullets
{
    NSMutableArray *removeBullets = [[NSMutableArray alloc] init];
    PlayerBullet *playerBullet;
    for (playerBullet in playerBullets) 
    {
	[playerBullet update];
	if ([playerBullet isOffScreen]) {
	    [removeBullets addObject:playerBullet];
	    [gameLayer removePlayerBullet:playerBullet];
	}
    }
    [playerBullets removeObjectsInArray:removeBullets];
}

-(void) warpPlayerOut
{
    warpOutCircle = [player warpOut];
    [gameLayer addSpriteToLayer: (TouchagaSprite *)warpOutCircle];
}

-(void) drainPlayerWarpEnergy
{
    if (warpOutCircle != nil)
	[warpOutCircle drainEnergy];
    if (playerInactiveLayer != nil)
	[playerInactiveLayer drainEnergy];
}

-(BOOL) isPlayerWarpingIn
{
    return warpOutCircle != nil && ([warpOutCircle warpIn]);
}

-(void) warpPlayerIn
{
    if (warpOutCircle != nil) {
	[gameLayer removeWarpOutCircle:warpOutCircle];
	warpOutCircle = nil;
    }
    if (playerInactiveLayer != nil) {
	[gameLayer removeChild:playerInactiveLayer cleanup:YES];
	[playerInactiveLayer release];
	playerInactiveLayer = nil;
    }
}

-(void) draw
{ 
    [self drawWarpMeter];
    [super draw];
}

-(void) drawWarpMeter
{
    int top_of_meter = (int)(190 * (float)[[player warpEnergy] percentEnergyFull] + 60);
    drawLine(ccp(450,60), ccp(450, top_of_meter));
}


@end
