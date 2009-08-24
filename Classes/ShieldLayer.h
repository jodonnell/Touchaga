//
//  ShieldLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"

/** A layer that draws the shield which for now is a opengl primitive. */
@interface ShieldLayer : Layer {
@private
    CGPoint pos;
    int shieldStrength;
}

/** The center of the circle, the player position. */
@property (nonatomic) CGPoint pos;

/** The current strength of the shield, based on how much energy the player has. */
@property (nonatomic) int shieldStrength;

/**
 * Sets the player shield energy.
 * @param The current amount of energy available to the shield.
 */
-(void) setShieldStrengthByEnergy:(int) energy;

@end
