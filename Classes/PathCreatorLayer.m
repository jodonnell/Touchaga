//
//  PathCreatorLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 9/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PathCreatorLayer.h"

#import "DrawingPrimitives.h"
#import "TouchDispatcher.h"
#import "Director.h"


@implementation PathCreatorLayer

@synthesize touched;
@synthesize linePoints;

-(id) init
{
    if( (self=[super init] )) {
	touched = NO;
	linePoints = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) dealloc
{
    [linePoints release];
    [super dealloc];
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

    if (touched == YES)
	return NO;

    touched = YES;
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
    touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];
    NSValue *value = [NSValue valueWithBytes:&touchPoint objCType: @encode(CGPoint)];

    [linePoints addObject: value];
}

-(void) draw
{
    glPointSize(1);
    glColor4ub(0,0,255,128);


    // get both this point and the next and draw a line between them
    for (int i = 0; i < [linePoints count]; i++) 
    {
	NSValue *value = [linePoints objectAtIndex:i];
	CGPoint point;
	[value getValue:&point];
	drawPoint(point);
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    touched = NO;
}


@end
