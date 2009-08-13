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


-(int) getTotalEnergy
{
	return unchargedEnergy + chargedEnergy;
}

@end
