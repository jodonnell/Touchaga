//
//  ShootButtonLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShootButtonLayer.h"

@implementation ShootButtonLayer

@synthesize shooting;

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
	shooting = NO;
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

-(BOOL) isShooting
{
    return shooting;
}

-(CGRect) getButtonRect
{
    return CGRectMake(0, 0, 80, 80);
}

- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if( touch ) {
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];

	if (CGRectContainsPoint([self getButtonRect], convertedPoint))
	{
	    shooting = YES;
	    return kEventHandled;
	}
    }
    return kEventIgnored;
}

- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if( touch ) {
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];
		
//     if your finger slides off button and you release it would get stuck shooting
	if (CGRectContainsPoint([self getButtonRect], convertedPoint))
	{
	    shooting = NO;
	    return kEventHandled;
	}
    }
    return kEventIgnored;
}

@end
