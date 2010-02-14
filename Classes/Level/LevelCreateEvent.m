//
//  LevelCreateEvent.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LevelCreateEvent.h"

@implementation LevelCreateEvent

@synthesize objectType;
@synthesize time;
@synthesize patternId;

-(id) init
{
    if( (self=[super init] )) {
        objectType = @"";
        patternId = 0;
        time = 0;
    }
    return self;
}

-(void) dealloc
{
    [objectType release];

    [super dealloc];
}

@end
