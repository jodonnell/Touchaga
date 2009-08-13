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
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}


-(BOOL) hasEnoughEnergy: (int) charge
{
    NSLog(@"%i", unchargedEnergy - charge);
    if (unchargedEnergy - charge > 0)
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

@end
