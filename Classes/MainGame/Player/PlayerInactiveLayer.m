//
//  PlayerInactivePlayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/6/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "PlayerInactiveLayer.h"

@implementation PlayerInactiveLayer

@synthesize player;
@synthesize warpIn;

-(id) initWithPlayer:(Player *) thePlayer;
{
    CGSize size = [[Director sharedDirector] winSize];
    if( (self=[super initWithColor:ccc4(64,64,64,128)] )) {
	self.isTouchEnabled = YES;
	self.player = thePlayer;
	self.warpIn = NO;
    }
    return self;
}

-(void) dealloc
{
    [player release];

    [super dealloc];
}

- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//     UITouch *touch = [touches anyObject];
//     if( touch ) {
// 	CGPoint location = [touch locationInView: [touch view]];
// 	CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];

// 	if (CGRectContainsPoint([self getButtonRect], convertedPoint))
// 	{
// 	    shooting = YES;
// 	    return kEventHandled;
// 	}
//     }
    return kEventIgnored;
}


@end

