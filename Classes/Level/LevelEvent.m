//
//  LevelEvent.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LevelEvent.h"

@implementation LevelEvent

@synthesize arguments;
@synthesize method;
@synthesize time;
@synthesize objId;

-(id) init
{
    if( (self=[super init] )) {
        arguments = [[NSMutableArray alloc] init];
        method = @"";
        objId = 0;
        time = 0;
    }
    
    return self;
}


-(void) dealloc
{
    [arguments release];
    [method release];

    [super dealloc];
}

-(void) setArgument: (int) argument
{
    // maybe should add argument type depending on method
    NSNumber *arg = [[NSNumber alloc] initWithInt:argument];
    [arguments addObject:arg];
}

@end
