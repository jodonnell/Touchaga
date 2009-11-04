//
//  ShieldLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShieldLayer.h"


@implementation ShieldLayer

@synthesize pos;
@synthesize shieldStrength;

-(id) init
{
    if( (self=[super init] )) {

    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

-(void) draw
{
    // this should probably get the energy rather than having it set
    glLineWidth(shieldStrength / 8);
    glColor4ub(0, 255, 0, 255);
    drawCircle( pos, shieldStrength, 0, 100, NO);
}

-(void) setShieldStrengthByEnergy:(int) energy
{
    if (energy <= 0)
	shieldStrength = 0;
    else
	shieldStrength = (energy / 10) + 20;
}

@end
