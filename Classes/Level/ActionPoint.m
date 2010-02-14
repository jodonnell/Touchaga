//
//  ActionPoint.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ActionPoint.h"

NSString * const ACTION_PRIMARY_SHOOT = @"primaryShoot";

@implementation ActionPoint

@synthesize action;
@synthesize time;

-(id)initWithTime:(int) inTime andActionPoint:(NSString *) inActionPoint
{
    if( (self=[super init] )) {
        time = inTime;
        action = inActionPoint;
    }

    return self;
}

-(void) dealloc
{
    [super dealloc];
}

-(BOOL) isActionPointPrimaryShoot
{
    if (action == ACTION_PRIMARY_SHOOT)
        return YES;
    return NO;
}

@end
