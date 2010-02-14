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

-(id) initWithLevel:(NSString *)level;
{
    if( (self=[super init] )) {
        SQLite3DataAccess *da = [SQLite3DataAccess sharedInstance];
        levelEvents = [da getLevel:1];
    }
    return self;
}

-(NSMutableArray *) getEventsWithTime:(int) time
{
    NSMutableArray *events = [[NSMutableArray alloc] init];

    LevelCreateEvent *levelEvent;
    for (levelEvent in levelEvents) 
    {
        if ([levelEvent time] == time)
            [events addObject:levelEvent];
    }

    return events;
}

@end
