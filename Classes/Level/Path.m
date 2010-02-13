//
//  Path.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Path.h"

@implementation Path

@synthesize path;

-(id)init
{
    if( (self=[super init] )) {
	path = [[NSMutableArray alloc] init];
    }

    return self;
}

-(BOOL) isValid
{
    if ([self isOnScreenBorder [path objectAtIndex:0]] && [self isOnScreenBorder [path objectAtIndex:[path count] - 1]])
	return YES;
    return NO;
}

-(void) addPoint:(CGPoint) point
{
    NSPoint point1 = {point.x, point.y};
    [path addObject: [NSValue valueWithPoint:point1]];
}

@end
