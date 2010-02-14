//
//  Path.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Path.h"
#import "cocos2d.h"

@implementation Path

@synthesize path;

-(id)init
{
    if( (self=[super init] )) {
        path = [[NSMutableArray alloc] init];
    }

    return self;
}

-(void) dealloc
{
    [path release];

    [super dealloc];
}

-(BOOL) isValid
{
//     if ([self isOnScreenBorder [path objectAtIndex:0]] && [self isOnScreenBorder [path objectAtIndex:[path count] - 1]])
//         return YES;
//     return NO;
}

-(void) addPoint:(CGPoint) point
{
    [path addObject: [NSValue valueWithCGPoint:point]];
}

-(CGPoint) getPosAtTime:(int) time
{
    return [[path objectAtIndex: time] CGPointValue];
}

-(BOOL) isPathOverAtTime:(int) time
{
    if (time > [path count])
        return YES;
    return NO;
}

@end
