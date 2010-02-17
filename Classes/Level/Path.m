//
//  Path.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Path.h"
#import "cocos2d.h"
#import "SQLite3DataAccess.h"

@interface Path()

/**
 * Checks to see if the point is off screen.
 * @param The point to check against.
 */
-(BOOL) isOffScreen:(CGPoint) point;

@end


@implementation Path

@synthesize path;

-(id)init
{
    if( (self=[super init] )) {
        path = [[NSMutableDictionary alloc] init];
    }

    return self;
}

-(id)initWithId:(int) pathId
{
    if( (self=[super init] )) {
        [self setPath: [[SQLite3DataAccess sharedInstance] getPath:pathId]];
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
    CGPoint first_point = [[path objectForKey: [NSNumber numberWithInt:0]] CGPointValue];
    CGPoint last_point = [[path objectForKey: [NSNumber numberWithInt:[path count] - 1]] CGPointValue];
    if ([self isOffScreen:first_point] && [self isOffScreen: last_point])
        return YES;
    return NO;
}

-(BOOL) isOffScreen:(CGPoint) point
{
    CGSize s = [[Director sharedDirector] winSize];

    if (s.height < point.y)
        return YES;
    if (0 > point.y)
        return YES;
    if (s.width < point.x)
        return YES;
    if (0 > point.x)
        return YES;
    return NO;
}

-(void) addPoint:(CGPoint) point atTime:(int) time
{
    [path setObject: [NSValue valueWithCGPoint:point] forKey:[NSNumber numberWithInt:time]];
}

-(CGPoint) getPosAtTime:(int) time
{
    return [[path objectForKey: [NSNumber numberWithInt:time]] CGPointValue];
}

-(BOOL) isPathOverAtTime:(int) time
{
    BOOL isPathOverAtTime = YES;
    NSArray *allTimes = [path allKeys];
    NSNumber *value;
    for (value in allTimes) {
        if (value > [NSNumber numberWithInt:time])
            isPathOverAtTime = YES;
    }

    return isPathOverAtTime;
}

@end
