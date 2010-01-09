//
//  WarpOutCircle.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "WarpOutCircle.h"
#import "Player.h"
#import "WarpEnergy.h"
#import "SpriteManager.h"

@implementation WarpOutCircle

@synthesize center;
@synthesize energy;
@synthesize player;
@synthesize warpIn;

-(id) initWithPlayer:(Player *) thePlayer;
{
//    self.isTouchEnabled = YES;
    player = thePlayer;
    center = thePlayer.position;
    energy = [[thePlayer warpEnergy] energy];
    spriteManager = [[WarpOutSpriteManager alloc] init];
    warpIn = NO;

    return [super initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
}

-(void) dealloc
{
    [player release];

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

