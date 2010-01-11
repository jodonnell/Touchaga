//
//  ShootButtonLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShootButtonLayer.h"
#import "Globals.h"

@interface ShootButtonLayer()

/** 
 * Returns the rect where the shoot button lies in.
 */
-(CGRect) getButtonRect;

@end


@implementation ShootButtonLayer

@synthesize shooting;

-(id) init
{
    if( (self=[super init] )) {
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
