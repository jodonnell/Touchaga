//
//  WarpEnergy.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/2/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "WarpEnergy.h"

@implementation WarpEnergy

@synthesize energy;
@synthesize maxEnergy;

-(id) init
{
    if( (self=[super init] )) {
        maxEnergy = 1000;
        energy = maxEnergy;
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

-(void) addEnergy:(int) inEnergy
{
    energy += inEnergy;
    if (energy > maxEnergy)
        energy = maxEnergy;
}

-(void) removeEnergy: (int) inEnergy
{
    energy -= inEnergy;
    if (energy < 0)
        energy = 0;
}

-(float) percentEnergyFull
{
    return (float)energy / (float)maxEnergy;
}

-(void) maxOutEnergy
{
    energy = maxEnergy;
}

@end
