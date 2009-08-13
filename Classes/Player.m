//
//  Player.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Player.h"


@implementation Player

@synthesize energy;
@synthesize lives;

-(id) init
{
	if( (self=[super init] )) {
		lives = 3;
	}

	return self;
}

- (void) dealloc
{
	[energy release];
	[super dealloc];
}

-(void) depleteEnergy: (int) charge
{
	energy.unchargedEnergy -= charge;
}

-(void) tapEnergy: (int) charge
{
	energy.chargedEnergy += charge;
}

@end
