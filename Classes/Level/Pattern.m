//
//  Pattern.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pattern.h"
#import "Path.h"
#import "ActionPoint.h"
#import "SQLite3DataAccess.h"

@implementation Pattern

@synthesize path;
@synthesize actions;

-(id)init
{
    if( (self=[super init] )) {
        path = [[Path alloc] init];
        actions = [[NSMutableDictionary alloc] init];
    }

    return self;
}

-(id)initWithId:(int) patternId
{
    if( (self=[super init] )) {
        SQLite3DataAccess *da = [SQLite3DataAccess sharedInstance];
        NSArray *pathAndActionIds = [da getPattern:patternId];
        int pathId = [[pathAndActionIds objectAtIndex:0] intValue];
        int actionsId = [[pathAndActionIds objectAtIndex:1] intValue];

        path = [[Path alloc] initWithId:pathId];
        actions = [self loadActionPointsWithId:actionsId];
    }

    return self;
}

-(void) dealloc
{
    [path release];
    [actions release];

    [super dealloc];
}

-(NSMutableDictionary *) loadActionPointsWithId:(int) actionsId
{
    SQLite3DataAccess *da = [SQLite3DataAccess sharedInstance];
    return [da getActionPoints:actionsId];
}

-(BOOL) isPatternOverAtTime:(int) relativeTime
{
    return [path isPathOverAtTime:relativeTime];
}

-(CGPoint) getPosAtTime:(int) relativeTime
{
   return [path getPosAtTime:relativeTime];
}

-(NSMutableArray *) getActionPointsAtTime:(int) relativeTime
{
    return [actions objectForKey: [NSNumber numberWithInt:relativeTime]];
}

@end
