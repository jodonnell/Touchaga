//
//  Player.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"
#import "Energy.h"
#import "ShieldLayer.h"

/**
 * The player sprite.  Implements the TargetedTouchDelegate protocol, the player is moved by touching
 * your finger to the player sprite and then as you move your finger the sprite follows it, until you 
 * lift your finger.
 * The player can shoot bullets.
 * The player also has a shield that when spent makes the player vulnerable to losing a life.
 */
@interface PlayerSprite : AtlasSprite <TargetedTouchDelegate> {
    Energy *energy;
    int lives;
    BOOL moving;
}

/** An energy object that represents the players pool of energy. */
@property (retain, nonatomic) Energy *energy;

/** The number of lives the player has. */
@property (nonatomic) int lives;

/** A BOOL, when true the player has their finger to the screen and is moving the player sprite */
@property (nonatomic) BOOL moving;

/**
 * Gets the CGRect that contains the area around the sprite that is used to register a touch.
 * @return The CGRect that contains the area around the sprite that is used to register a touch.
 */
-(CGRect)getTouchBox;

/**
 * Returns all the charged energy and sets charged energy back down to zero.
 * @return The charged energy.
 */
-(int) fire;

/**
 * @see Energy::hasEnoughEnergy
 */
-(BOOL) hasEnoughEnergy: (int) charge;

/**
 * @see Energy::chargingEnergy
 */
-(void) chargingEnergy: (int) charge;

/**
 * @see Energy::regainEnergy
 */
-(void) regainEnergy: (int) energyToRegain;

/**
 * Gets shield layer
 * @return The ShieldLayer.
 */
-(ShieldLayer *) getShieldLayer;

/**
 * Gets the player layer.
 * @return The PlayerLayer.
 */
-(PlayerLayer *) getPlayerLayer;

/**
 * Sets the shield layers energy based on players energy.
 */
-(void) updateShieldStrength;

@end
