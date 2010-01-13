//
//  WarpOutCircle.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.


#import "cocos2d.h"
#import "TouchagaSprite.h"

@class Player;

/**
 * The sprite that represents the area that a player can warp in to.  The sprite
 * gets scaled smaller as the player warp energy runs out.  When the player is warped out
 * this sprite is active, it looks for touches to signal that the player is warping back in,
 * if it gets a touch it sets isPlayerWarpingIn. This needs a reference to the player because when the
 * touch handler is called it needs to set the player's position before the player touch
 * handler handles the same touch.
 */
@interface WarpOutCircle : TouchagaSprite <TargetedTouchDelegate> {
    BOOL isPlayerWarpingIn;
    BOOL isActive;
    Player *player;
}

/** A BOOL, when YES it signals the player to warp in. */
@property (nonatomic) BOOL isPlayerWarpingIn;

/** A BOOL, when YES the sprite is on screen. */
@property (nonatomic) BOOL isActive;

/** The player object. */
@property (retain, nonatomic) Player *player;

/**
 * Constructor
 * @param thePlayer The Player object.
 * @return id The PlayerInactiveLayer
 */
-(id) initWithPlayer:(Player *) thePlayer;

/**
 * Updates the scale factor of the sprite.
 */
-(void)updateScaleFactor;

/**
 * Sets the warp out sprite at the players position and resets state variables to player just warped out state.
 * @param The point to have the warp circle centered at.
 */
-(void)startWarpOut:(CGPoint) warpInPoint;

@end
