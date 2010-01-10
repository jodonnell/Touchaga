//
//  ShootButtonLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShootButtonLayer.h"
#import "Globals.h"

@implementation ShootButtonLayer

@synthesize shooting;

-(id) init
{
    if( (self=[super init] )) {
//	self.isTouchEnabled = YES;
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
    return [[Globals sharedInstance] shootButtonRect];
}

// - (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
// {
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
//     return kEventIgnored;
// }

// - (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
// {
//     UITouch *touch = [touches anyObject];
//     if( touch ) {
// 	CGPoint location = [touch locationInView: [touch view]];
// 	CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];
		
// //     if your finger slides off button and you release it would get stuck shooting
// 	if (CGRectContainsPoint([self getButtonRect], convertedPoint))
// 	{
// 	    shooting = NO;
// 	    return kEventHandled;
// 	}
//     }
//     return kEventIgnored;
// }

// - (BOOL)ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
// {
//     NSLog(@"toheu" );
//     shooting = NO;
//     return YES;
// }

- (void)onEnter
{
    [[TouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

- (void)onExit
{
    [[TouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}	

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
    touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];

    if (CGRectContainsPoint([self getButtonRect], touchPoint)) {
	shooting = YES;
	return YES;
    }
    else 
	return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
    touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];

    if (CGRectContainsPoint([self getButtonRect], touchPoint))
	shooting = YES;
    else
	shooting = NO;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    shooting = NO;
}


@end
