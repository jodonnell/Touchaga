//
//  Player.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Energy.h"
#import "ShieldLayer.h"
#import "PlayerLayer.h"

/**
 * The player sprite.  Implements the TargetedTouchDelegate protocol, the player is moved by touching
 * your finger to the player sprite and then as you move your finger the sprite follows it, until you 
 * lift your finger.
 * The player can shoot bullets.
 */
@interface PlayerSprite : AtlasSprite <TargetedTouchDelegate> {
@private
    WarpEnergy *warpEnergy;
    int lives;
    int score;
    BOOL invincible;
}

/** An energy object that represents the players pool of warp energy. */
@property (retain, nonatomic) WarpEnergy *warpEnergy;

/** The number of lives the player has. */
@property (nonatomic) int lives;

/** The score the player has. */
@property (nonatomic) int score;

/** A BOOL, when YES the player is invincible. */
@property (nonatomic) BOOL invincible;

// PUBLIC METHODS

/**
 * Creates a PlayerBullet that is created right above player position
 * @return PlayerBullet that is created right above player position
 */
-(PlayerBullet *) shoot;

/**
 * Moves the player to the position at point.
 * @param point The point to move the player to.
 */
-(void) moveTo: (CGPoint) point;

/**
 * Is the player currently invincible?
 * @return YES if the player is currently invincible, NO otherwise.
 */
-(BOOL) isInvincible;

/**
 * Is the player out of lives?
 * @return YES if the player is currently dead, NO otherwise.
 */
-(BOOL) isDead;

/**
 * Returns the players current score.
 * @return The players score.
 */
-(int) getScore;

/**
 * The player warps off the screen.  This makes the player
 * invincible but a timer starts where they start losing warp meter.
 * This will normally be triggered when the player's finger leaves the 
 * screen.
 * @return The warp sprite to be attached to the screen.
 */
-(WarpSprite *) warpOut;

/**
 * Warps the player back in at the passed in point.  Makes the player vulnerable again.
 * Normally called when the player puts their finger back in the screen within the 
 * warp sprite bounds.
 * @param point The point to warp the player back in at.  Must be within warp sprite's bounds.
 */
-(void) warpIn: (CGPoint) point;

/**
 * Adds the passed in integer to the players score.
 * @param addScore Score to add to the player's current score.
 */
-(void) addScore: (int) addScore;

/**
 * The player looses a life, and the state is set to a modified warp out.
 */
-(void) loseLife;

@end
