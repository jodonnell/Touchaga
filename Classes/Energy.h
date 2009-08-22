//
//  Energy.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * An object that represents the energy that a player currently has.
 * There are two kinds of energy, charged energy and uncharged energy.
 * Uncharged energy is free energy that can be used to shoot or used to power the shield.
 * Charged energy is uncharged energy that has been converted into this type which when released will 
 * affect the size of the player bullet.
 */
@interface Energy : NSObject {
    int unchargedEnergy;
    int chargedEnergy;
    int maxEnergy;
}

/** An integer that contains the amount of energy the player has that is not currently being charged. */
@property (nonatomic) int unchargedEnergy;

/** An integer that contains the amount of charged energy that the player has accumulated. */
@property (nonatomic) int chargedEnergy;

/** An integer that contains the max amount of energy the player can have. */
@property (nonatomic) int maxEnergy;

/**
 * Creates a PlayerBulletSprite and adds it to the screen at the given position.
 * @return An integer that has the amount of energy that a player has, both charged and uncharged.
 */
-(int) getTotalEnergy;

/**
 * Given a charge returns whether the player could accrue that much more energy.
 * @param charge An int, the charge level you are checking against.
 * @return BOOL
 */
-(BOOL) hasEnoughEnergy: (int) charge;

/**
 * Given a charge it will add this back to the players uncharged energy.
 * @param energyToRegain The amount of energy that will be added back to the uncharged energy.
 */
-(void) regainEnergy: (int) energyToRegain;

/**
 * Sets the chargedEnergy back down to zero.t
 * @return Returns the amount of charged energy that the player had accrued.
 */
-(int) releaseChargedEnergy;

/**
 * Adds the energy to charge to the players charged energy and removes it from the uncharged energy
 * as long as the uncharged energy is available.
 * @param energyToCharge Adds this amount of energy to the charged energy.
 */
-(void) chargingEnergy: (int) energyToCharge;

@end
