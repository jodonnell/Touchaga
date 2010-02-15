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
#import "WarpEnergy.h"
#import "Background.h"
#import "Level.h"
#import "LevelCreateEvent.h"
#import "Pattern.h"
#import "Enemy.h"
#import "PatternableObjectFactory.h"

#import "PlayerInactiveLayer.h"

#import "cocos2d.h"


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
@synthesize background;
@synthesize level;
@synthesize time;
@synthesize patternableObjects;

-(id) init
{
    if( (self=[super init] )) {
        patternableObjects = [[NSMutableArray alloc] init];
        playerBullets = [[NSMutableArray alloc] init];
        gameLayer = nil;
        gameLayer = [GameLayer sharedInstance];
        shootButtonLayer = [[ShootButtonLayer alloc] init];

        player = [[Player alloc] init];
        [gameLayer addSpriteToLayer:player];
        [player deactivate];

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
    [background release];
    [level release];
    [patternableObjects release];

    [super dealloc];
}

-(void) update: (ccTime) dt
{
    NSMutableArray *currentEvents = [level getEventsWithTime:time];
    if ([currentEvents count])
        [self executeCreateEvents:currentEvents];

    if ([patternableObjects count])
        [self updatePatternableObjects];

    if ([self isShooting] && [player canShoot])
        [self shootBullet];

    if ([player canShoot] == NO)
        [player incrementBulletCoolDown];

    [self updatePlayerBullets];

    if ([player isWarpedOut]) {
        [player playerDrainEnergy];
    }

    if ([player isOutOfWarpEnergy]) {
        [player loseLife];
    }

    [self checkForCollusions];

    if ([player isGameOver]) {
        NSLog(@"game over");
        [[Director sharedDirector] end];
    }

    time++;
}

// PRIVATE

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
    LevelCreateEvent *currentEvent;
    for (currentEvent in currentEvents) {
        Pattern *pattern = [[Pattern alloc] initWithId:[currentEvent patternId]];

        Enemy *patternableObject = [PatternableObjectFactory initWithType:[currentEvent objectType] andPattern:pattern andStartTime:time];
        [patternableObjects addObject:patternableObject];
    }
}

-(void) updatePatternableObjects
{
    Enemy *patternableObject;
    for (patternableObject in patternableObjects) {
        [patternableObject moveToAtTime:time];
    }
}

-(void) checkForCollusions
{
    Enemy *patternableObject;
    for (patternableObject in patternableObjects) {
        if (CGRectIntersectsRect([patternableObject makeRect], [player makeRect]) && ! [player isWarpedOut]) {
            [player loseLife];
        }
    }

}

@end
