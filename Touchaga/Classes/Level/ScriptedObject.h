//
//  ScriptedObject.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"

@class Pattern;

/**
 * A base class for all enemy objects, contains the necessary logic to have enemies
 * interact with the pattern they follow.
 */
@interface ScriptedObject : TouchagaSprite {
    Pattern *pattern;
    int startTime;
}

/** The Pattern the enemy follows. */
@property (retain, nonatomic) Pattern *pattern;

/** The time the enemy is created and the pattern begins. */
@property (nonatomic) int startTime;


/**
 * Constructor 
 * @param inStartTime The time the enemy was created.
 * @param inPattern The pattern to load the enemy with.
 * @param rect The objcets rect within the sprite manager.
 * @param manager The sprite manager.
 * @return The newly created enemy object.
 */
-(id)initWithStartTime:(int) inStartTime andPattern:(Pattern *) inPattern andRect:(CGRect) rect andManager:(AtlasSpriteManager *) manager;

/**
 * Moves the enemy to where it should be on a path at the current time.
 * @param currentTime The current time since the level started.
 */
-(void)moveToAtTime:(int) currentTime;

/**
 * Executes all actions that exist at a current time.
 * @param currentTime The current time since the level started.
 */
-(void)doActionPointsAtTime:(int) currentTime;

/**
 * Abstract method that shoots a primary shot.
 */
-(void) primaryShoot;

@end
