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
#import "Level.h"
#import "LevelEvent.h"

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
 * Checks to see if the player is shooting.
 * @return YES if the player is shooting.
 */
-(BOOL) isShooting;

/** 
 * Draws the warp meter on to the MainGameLoop node.
 */
-(void) drawWarpMeter;

/** 
 * The player died, make him lose a life and put the inactive player layer back up.
 */
-(void) playerDied;

@end

@implementation MainGameLoop

@synthesize gameLayer;
@synthesize player;
@synthesize shootButtonLayer;
@synthesize playerBullets;
@synthesize warpOutCircle;
@synthesize playerInactiveLayer;
@synthesize background;
@synthesize level;
@synthesize time;

-(id) init
{
    if( (self=[super init] )) {
        playerBullets = [[NSMutableArray alloc] init];
        gameLayer = nil;
        gameLayer = [GameLayer sharedInstance];
        shootButtonLayer = [[ShootButtonLayer alloc] init];

        player = [[Player alloc] init];
        [gameLayer addSpriteToLayer:player];

        playerInactiveLayer =  [[PlayerInactiveLayer alloc] initWithPlayer: player];
        [playerInactiveLayer setIsActive:YES];
        [gameLayer addChild:(Layer *)playerInactiveLayer z:HIGHEST_Z_VALUE];

        warpOutCircle = [[WarpOutCircle alloc] initWithPlayer:player];

        background = [[Background alloc] init];
        [gameLayer addSpriteToLayer:background];

        level = [[Level alloc] initWithLevel:@"level1"];

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
    [warpOutCircle release];
    [level release];

    [super dealloc];
}

-(void) update: (ccTime) dt
{
    NSMutableArray *currentEvents = [level getEventsWithTime:time];
    if ([currentEvents count])
        [self executeCreateEvents:currentEvents];

    if ([self isShooting] && [player canShoot])
        [self shootBullet];

    if ([player canShoot] == NO)
        [player incrementBulletCoolDown];

    [self updatePlayerBullets];

    if ([player warpPlayerOut])
        [self warpPlayerOut];

    if ([player isWarpedOut]) {
        [self drainPlayerWarpEnergy];
        [warpOutCircle updateScaleFactor];
    }

    if ([warpOutCircle isActive] && [warpOutCircle isPlayerWarpingIn])
        [self warpPlayerIn];

    if ([playerInactiveLayer isActive] && [playerInactiveLayer isPlayerWarpingIn])
        [self warpPlayerIn];

    if ([player isOutOfWarpEnergy])
        [self playerDied];

    if ([player isGameOver])
        [[Director sharedDirector] end];

    time++;
}

// PRIVATE
-(void) playerDied
{
    [self warpPlayerIn];
    [player loseLife];
    [playerInactiveLayer startWarpOut];
    [gameLayer addChild:(Layer *)playerInactiveLayer z:HIGHEST_Z_VALUE];
}

-(BOOL) isShooting
{
    return [shootButtonLayer isShooting] && [player isWarpedOut] == NO;
}

-(void) shootBullet
{
    PlayerBullet *playerBullet = [[PlayerBullet alloc] init];
    [playerBullet moveTo:player.position];
    [gameLayer addSpriteToLayer:playerBullet];

    [playerBullets addObject: playerBullet];
    [playerBullet release];

    [player shootBullet];
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
    [removeBullets release];
}

-(void) warpPlayerOut
{
    [warpOutCircle startWarpOut:player.position];
    [player warpOut];
    [gameLayer addSpriteToLayer: (TouchagaSprite *)warpOutCircle];
}

-(void) drainPlayerWarpEnergy
{
    if ([warpOutCircle isActive] || [playerInactiveLayer isActive])
        [[player warpEnergy] removeEnergy: 1];
}

-(void) warpPlayerIn
{
    if ([warpOutCircle isActive]) {
        [gameLayer removeWarpOutCircle:warpOutCircle];
        [warpOutCircle setIsActive:NO];
    }
    if ([playerInactiveLayer isActive]) {
        [gameLayer removeChild:playerInactiveLayer cleanup:YES];
        [playerInactiveLayer setIsActive:NO];
    }
}

-(void) draw
{ 
    [self drawWarpMeter];
    [super draw];
}

-(void) drawWarpMeter
{
    int xPos = 35;
    int bottomOfMeter = 100;
    int topOfMeter = (int)(190 * (float)[[player warpEnergy] percentEnergyFull] + bottomOfMeter);
    drawLine(ccp(xPos,bottomOfMeter), ccp(xPos, topOfMeter));
}


-(void) executeCreateEvents:(NSMutableArray *) currentEvents;
{
    LevelEvent *currentEvent;
    for (currentEvent in currentEvents) {
        Pattern *pattern = [[Pattern alloc] initWithId:[currentEvents pattern Id]];

        Enemy *patternableObject = [PatternableObjectFactory initWithType:[currentEvent objectType] andPattern:pattern andStartTime:time];
        [patternableObjects addObject:patternableObject];
    }
}

@end
