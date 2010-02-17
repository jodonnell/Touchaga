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
#import "ScriptedObject.h"
#import "ScriptedObjectFactory.h"

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
@synthesize scriptedObjects;

-(id) init
{
    if( (self=[super init] )) {
        scriptedObjects = [[NSMutableArray alloc] init];
        playerBullets = [[NSMutableArray alloc] init];
        gameLayer = nil;
        gameLayer = [GameLayer sharedInstance];
        shootButtonLayer = [[ShootButtonLayer alloc] init];

        player = [[Player alloc] init];
        [gameLayer addSpriteToLayer:player];
        [player deactivate];

        background = [[Background alloc] init];
        [gameLayer addSpriteToLayer:background];

        level = [[Level alloc] initWithLevel:1];
        time = 0;

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
    [scriptedObjects release];

    [super dealloc];
}

-(void) update: (ccTime) dt
{
    [self executeCreateEvents];
    
    [self updateScriptedObjects];

    if ([self isShooting])
        [self shootBullet];

    [player update];

    [self updatePlayerBullets];

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
    return [shootButtonLayer isShooting] && [player isWarpedOut] == NO && [player canShoot];
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


-(void) executeCreateEvents
{
    NSMutableArray *currentEvents = [level getEventsWithTime:time];

    LevelCreateEvent *currentEvent;
    for (currentEvent in currentEvents) {
        Pattern *pattern = [[Pattern alloc] initWithId:[currentEvent patternId]];
        ScriptedObject *scriptedObject = [ScriptedObjectFactory initWithType:[currentEvent objectType] andPattern:pattern andStartTime:time];
        [pattern release];
        [scriptedObjects addObject:scriptedObject];
    }
}

-(void) updateScriptedObjects
{
    NSMutableArray *removeEnemies = [[NSMutableArray alloc] init];

    ScriptedObject *scriptedObject;
    for (scriptedObject in scriptedObjects) {
        [scriptedObject moveToAtTime:time];

        if ([scriptedObject isOffScreen]) {
            [removeEnemies addObject:scriptedObject];
            [gameLayer removeScriptedObject:scriptedObject];
        }
    }
    [scriptedObjects removeObjectsInArray:removeEnemies];
    [removeEnemies release];
}

-(void) checkForCollusions
{
    NSMutableArray *removeEnemies = [[NSMutableArray alloc] init];
    ScriptedObject *scriptedObject;
    for (scriptedObject in scriptedObjects) {
        [self checkForPlayerCollusion:scriptedObject];

        if ([self checkForBulletCollusion:scriptedObject])
            [removeEnemies addObject:scriptedObject];
    }
    [scriptedObjects removeObjectsInArray:removeEnemies];
    [removeEnemies release];
}

-(void) checkForPlayerCollusion:(ScriptedObject *)scriptedObject
{
    if (CGRectIntersectsRect([scriptedObject makeRect], [player makeRect]) && ! [player isWarpedOut]) {
        [player loseLife];
    }
}

-(BOOL) checkForBulletCollusion:(ScriptedObject *)scriptedObject
{
    PlayerBullet *playerBullet;
    for (playerBullet in playerBullets) 
    {
        if (CGRectIntersectsRect([scriptedObject makeRect], [playerBullet makeRect])) {
            [gameLayer removeScriptedObject:scriptedObject];
            return YES;
        }
    }
    return NO;
}

@end
