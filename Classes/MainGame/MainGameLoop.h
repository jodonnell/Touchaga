//
//  MainGameLoop.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class GameLayer;
@class Player;
@class ShootButtonLayer;
@class PlayerBullet;
@class Background;
@class Level;
@class ScriptedObject;

/**
 * This class holds orchestrates the flow of the game.
 * It is responsible for controlling what goes on and off the GameLayer.
 * It also controls updating all the different components and interacting between them.
 */
@interface MainGameLoop : CocosNode {
    GameLayer *gameLayer;
    Player *player;
    ShootButtonLayer *shootButtonLayer;
    NSMutableArray *playerBullets;
    Background *background;
    Level *level;
    int time;
    NSMutableArray *scriptedObjects;
}

/** A NSMutableArray that contains all the player bullet sprite objects */
@property (retain, nonatomic) NSMutableArray *playerBullets;

/** The layer that contains everything within the main game */
@property (retain, nonatomic) GameLayer *gameLayer;

/** The player object */
@property (retain, nonatomic) Player *player;

/** The layer with the shoot button on it. */
@property (retain, nonatomic) ShootButtonLayer *shootButtonLayer;

/** The background. */
@property (retain, nonatomic) Background *background;

/** The Level object. */
@property (retain, nonatomic) Level *level;

/** Time, every tick ups this value. */
@property (nonatomic) int time;

/** An array of all the onscreen objects that use a pattern. */
@property (nonatomic, retain) NSMutableArray *scriptedObjects;

/** 
 * Called every frame, does all the updating for the game.
 */
-(void) update: (ccTime) dt;

/** 
 * Executes all create events in the given array, this will create any scripted objects.
 */
-(void) executeCreateEvents;

/** 
 * Updates all scripted objects, running them both on their path, and executing action points.
 */
-(void) updateScriptedObjects;

/** 
 * Checks scripted objects for collisions.
 */
-(void) checkForCollusions;

/** 
 * Checks if there is a collision between a scripted object and the player.
 * Will call lose life on player if there is a collision.
 * @param scriptedObject The scripted object to check.
 */
-(void) checkForPlayerCollusion:(ScriptedObject *)scriptedObject;

/** 
 * Checks scripted object for collisions with player bullets.
 * @param scriptedObject The scripted object to check.
 * @return YES if there is a collision.
 */
-(BOOL) checkForBulletCollusion:(ScriptedObject *)scriptedObject;

@end
