//
//  Player.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "TouchagaSprite.h"

@class WarpEnergy;
@class PlayerBullet;
@class WarpOutCircle;
@class PlayerInactiveLayer;

/**
 * The player sprite.  Implements the TargetedTouchDelegate protocol.
 * The player starts its life off in the inactive state.  Here your warp energy is draining,
 * the player is warped out and can warp in anywhere on the screen.
 * The player can than warp out at any time by lifting their finger off the screen.  They can 
 * warp back in anywhere in a circle that is created around the point from where they warped out.
 * The size of the circle is dependant on the amount of warp energy the player has.  Their energy will drain
 * in the warped out state.  When the player is warped in their position is directly under the player finger.  The player
 * finger act as the ship.
 * The player can never warp in on top of the shoot button.
 * The player has a score.
 * When the player loses all his lives it is game over.
 */
@interface Player : TouchagaSprite <TargetedTouchDelegate> {
    WarpEnergy *warpEnergy;
    int lives;
    int score;
    BOOL invincible;
    BOOL isWarpedOut;
    BOOL isGameOver;
    int bulletCoolDown;
    BOOL canShoot;
    WarpOutCircle *warpOutCircle;
    PlayerInactiveLayer *inactiveLayer;
}

/** The player inactive layer, attached to screen when player dies or start of level. */
@property (retain, nonatomic) PlayerInactiveLayer *inactiveLayer;

/** The Warp out circle, gets attached to screen when the player warps out. */
@property (retain, nonatomic) WarpOutCircle *warpOutCircle;

/** An energy object that represents the players pool of warp energy. */
@property (retain, nonatomic) WarpEnergy *warpEnergy;

/** The number of lives the player has. */
@property (nonatomic) int lives;

/** The score the player has. */
@property (nonatomic) int score;

/** A BOOL, when YES the player is invincible. */
@property (nonatomic) BOOL invincible;

/** A BOOL, when YES the player is warped out. */
@property (nonatomic) BOOL isWarpedOut;

/** A BOOL, when YES the player is out of lives. */
@property (nonatomic) BOOL isGameOver;

/** A INT, The counter of cool down time after a bullet has been shot. */
@property (nonatomic) int bulletCoolDown;

/** A BOOL, when YES the player can shoot. */
@property (nonatomic) BOOL canShoot;

/**
 * Constructor
 * @return id The Sprite
 */
-(id)init;

/**
 * Is the player currently invincible?
 * @return YES if the player is currently invincible, NO otherwise.
 */
-(BOOL) isInvincible;

/**
 * The player warps off the screen.  This makes the player
 * invincible but a timer starts where they start losing warp meter.
 * This will normally be triggered when the player's finger leaves the 
 * screen.
 */
-(void) warpOut;

/**
 * Warps the player back in at the passed in point.  Makes the player vulnerable again.
 * Normally called when the player puts their finger back in the screen within the 
 * warp sprite bounds. You cannot warp into the shooting button layer.
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

/**
 * Checks to see if the player is out of warp energy and has the side effect of setting the player to dead
 * if they are out of the juice.
 */
-(BOOL) isOutOfWarpEnergy;

/**
 * Determines if a given point is within the shoot button rect. PRIVATE.
 * @param touchPoint The touch to check if it is in rect.
 * @return YES if the touch is in the shoot button, NO otherwise
 */
-(BOOL) isTouchInShootButton:(CGPoint) touchPoint;

/**
 * When shooting a button, starts the cool down until another bullet can be shot.
 */
-(void) shootBullet;

/**
 * Increments the bullet cool down counter
 * NOTE: maybe should change name, it breaks the abstraction
 */
-(void) incrementBulletCoolDown;

/**
 * Checks to see if the player can shoot. Also checks to see if the bullet
 * cool down time has been reached and return YES if so.
 * @return Yes if the player can shoot.
 */
-(BOOL) canShoot;

/**
 * Drains the player energy.
 */
-(void) playerDrainEnergy;

/**
 * Deactivates the player and turns on the inactive layer.
 */
-(void) deactivate;

/**
 * Removes both the inactive layer and warp out layer if either are active.
 */
-(void) removeWarps;

/**
 * Updates player things that need to be updated on every frame.
 */
-(void) update;

@end
