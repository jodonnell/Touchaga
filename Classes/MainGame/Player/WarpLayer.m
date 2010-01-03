//
//  WarpLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "WarpLayer.h"

@implementation WarpLayer

@synthesize warpIn;
@synthesize center;
@synthesize energy;

-(id) initWithCenterPoint: (CGPoint) point andEnergy:(int) inEnergy
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
	self.warpIn = NO;
	self.center = point;
	self.energy = inEnergy;
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

-(void) draw
{
    glLineWidth(2);
    glColor4ub(0, 255, 255, 255);
    drawCircle( self.center, [self convertEnergyToRadius], CC_DEGREES_TO_RADIANS(90), 50, NO);
}

- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if( touch ) {
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];

	if (CGRectContainsPoint(CGRectMake(self.center.x - 40, self.center.y - 40, self.center.x + 40, self.center.y + 40), convertedPoint))
	{
	    self.warpIn = YES;
	    return kEventHandled;
	}
    }
    return kEventIgnored;
}

-(int)convertEnergyToRadius
{
    return self.energy;
}

@end

