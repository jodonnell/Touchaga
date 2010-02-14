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
        path = [[SQLite3DataAccess sharedInstance] getPath:pathId];
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
