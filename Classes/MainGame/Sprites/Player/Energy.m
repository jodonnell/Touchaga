//
//  Energy.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Energy.h"

@implementation Energy

@synthesize unchargedEnergy;
@synthesize chargedEnergy;
@synthesize maxEnergy;

-(id) init
{
    if( (self=[super init] )) {
	maxEnergy = 100;
	unchargedEnergy = maxEnergy;
	chargedEnergy = 0;
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

-(BOOL) hasEnoughEnergy: (int) charge
{
    if (unchargedEnergy - charge >= 0)
	return YES;
    return NO;
}

-(int) getTotalEnergy
{
    return unchargedEnergy + chargedEnergy;
}

-(void) regainEnergy: (int) energyToRegain
{
    unchargedEnergy += energyToRegain;

    if (unchargedEnergy > maxEnergy)
	unchargedEnergy = maxEnergy;
}

-(void) chargingEnergy: (int) energyToCharge
{
    if ([self hasEnoughEnergy: energyToCharge])
    {
	unchargedEnergy -= energyToCharge;
	chargedEnergy += energyToCharge;
    }
}

-(int) releaseChargedEnergy
{
    int now_energy = chargedEnergy;
    chargedEnergy = 0;
    return now_energy;
}

@end
