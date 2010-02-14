//
//  Action.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Action.h"

NSString * const ACTION_PRIMARY_SHOOT = @"primaryShoot";

@implementation Action

@synthesize action;
@synthesize time;

-(id)initWithTime:(int) inTime andAction:(NSString *) inAction
{
    if( (self=[super init] )) {
        time = inTime;
        action = inAction;
    }

    return self;
}

-(void) dealloc
{
    [super dealloc];
}

-(BOOL) isActionPrimaryShoot
{
    if (action == ACTION_PRIMARY_SHOOT)
        return YES;
    return NO;
}

@end
