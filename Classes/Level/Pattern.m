//
//  Pattern.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pattern.h"
#import "Path.h"
#import "Action.h"

@implementation Pattern

@synthesize path;
@synthesize actions;

-(id)init
{
    if( (self=[super init] )) {
        path = [[Path alloc] init];
        actions = [[NSMutableArray alloc] init];
    }

    return self;
}

-(id)initWithId:(int) patternId
{
    if( (self=[super init] )) {
        path = [[Path alloc] init];
        actions = [[NSMutableArray alloc] init];
    }

    return self;
}

-(void) dealloc
{
    [path release];
    [actions release];

    [super dealloc];
}

-(BOOL) isPatternOverAtTime:(int) relativeTime
{
    return [path isPathOverAtTime:relativeTime];
}

-(CGPoint) getPosAtTime:(int) relativeTime
{
   return [path getPosAtTime:relativeTime];
}

-(NSMutableArray *) getActionsAtTime:(int) relativeTime
{
    NSMutableArray *nowActions = [[NSMutableArray alloc] init];
    for (action in actions) {
        if ([action time] == relativeTime)
            [nowActions addObject:action];
    }
    return nowActions;
}

@end
