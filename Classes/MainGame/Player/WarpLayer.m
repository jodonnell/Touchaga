//
//  WarpLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "WarpLayer.h"
#import "Player.h"

@implementation WarpLayer

@synthesize center;
@synthesize energy;
@synthesize player;
@synthesize warpIn;

-(id) initWithPlayer:(Player *) thePlayer;
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
	self.player = thePlayer;
	self.center = thePlayer.position;
	self.energy = [[thePlayer warpEnergy] energy];
	self.warpIn = NO;
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

	if (CGRectContainsPoint(CGRectMake(self.center.x - [self convertEnergyToRadius], self.center.y - [self convertEnergyToRadius], [self convertEnergyToRadius] * 2, [self convertEnergyToRadius] * 2), convertedPoint))
	{
	    [player warpIn:convertedPoint];
	    warpIn = YES;
	    return kEventIgnored; // we want the player touch method to pick this up now
	}
    }
    return kEventIgnored;
}

-(int)convertEnergyToRadius
{
    return self.energy / 10;
}

-(void)drainEnergy
{
    [[player warpEnergy] removeEnergy: 1];
    energy = [[player warpEnergy] energy];
}

@end

