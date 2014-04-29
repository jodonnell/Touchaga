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
 * gets scaled smaller as the player warp energy runs out. This needs a reference to the player because when the
 * touch handler is called it needs to set the player's position before the player touch
 * handler handles the same touch.
 */
@interface WarpOutCircle : TouchagaSprite <TargetedTouchDelegate> {
    Player *player;
}

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

/** 
 * Unfortunately WarpOutCircle needs a reference to the player, and the player has a reference to the warp out circle.
 * This happens because in their touch callbacks they need to update each other immediately, as sometimes the handler,
 * will pass the touch up expecting the player to pick it up in the correct location.  To fix this circular reference,
 * this method must be called before destructing either the player class which will in turn destruct this object.
 */
-(void) removePlayer;

@end
