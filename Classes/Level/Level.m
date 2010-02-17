//
//  Level.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import <sqlite3.h>
#import "LevelCreateEvent.h"
#import "SQLite3DataAccess.h"

@implementation Level

@synthesize levelEvents;

-(id) initWithLevel:(int) level
{
    if( (self=[super init] )) {
        SQLite3DataAccess *da = [SQLite3DataAccess sharedInstance];
        [self setLevelEvents: [da getLevel:level]];
    }
    return self;
}

-(void) dealloc
{
    [levelEvents release];

    [super dealloc];
}

-(NSMutableArray *) getEventsWithTime:(int) time
{
    NSMutableArray *events = [NSMutableArray array];

    LevelCreateEvent *levelEvent;
    for (levelEvent in levelEvents) 
    {
        if ([levelEvent time] == time)
            [events addObject:levelEvent];
    }

    return events;
}

@end
