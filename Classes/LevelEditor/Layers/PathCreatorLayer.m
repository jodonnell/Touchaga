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

-(void) drawAllLines
{
// get both this point and the next and draw a line between them
    for (int i = 0; i < [linePoints count] - 1; i++) 
    {
	CGPoint point1, point2;
	NSValue *value1 = [linePoints objectAtIndex:i];
	NSValue *value2 = [linePoints objectAtIndex:i + 1];
	[value1 getValue:&point1];
	[value2 getValue:&point2];
	drawLine(point1, point2);
    }
}

-(void) draw
{
    glPointSize(1);
    glColor4ub(0,0,255,128);

    glEnable(GL_LINE_SMOOTH);

    if ([linePoints count] > 1)
    {
	[self drawAllLines];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    touched = NO;
}


@end
