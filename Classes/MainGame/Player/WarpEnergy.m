//
//  WarpEnergy.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/2/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "WarpEnergy.h"

@implementation WarpEnergy

@synthesize energy;

-(id) init
{
    if( (self=[super init] )) {
	energy = 1000;
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

-(void) addEnergy:(int) inEnergy
{
    self.energy += inEnergy;
}

-(void) removeEnergy: (int) inEnergy
{
    self.energy -= inEnergy;
}

@end
