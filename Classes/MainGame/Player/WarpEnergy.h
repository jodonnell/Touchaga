//
//  WarpEnergy.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/2/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import <Foundation/Foundation.h>

/**
 * An object that represents the energy that a player currently has.
 */
@interface WarpEnergy : NSObject {
    int energy;
    int maxEnergy;
}

/** An integer that contains the amount of energy the player has. */
@property (nonatomic) int energy;

/** An integer that contains the max amount of energy. */
@property (nonatomic) int maxEnergy;

/**
 * Adds more energy to your current energy.
 * @param energy The amount of energy to add to the players pool.
 */
-(void) addEnergy:(int) inEnergy;

/**
 * Creates a PlayerBulletSprite and adds it to the screen at the given position.
 * @param energy The amount of energy to remove from the players pool.
 */
-(void) removeEnergy:(int) inEnergy;

/**
 * Gives you the percent the energy is full.
 * @return float The percent the energy is full.
 */
-(float) percentEnergyFull;

/**
 * Resets the energy to the max
 */
-(void) maxOutEnergy;

@end
