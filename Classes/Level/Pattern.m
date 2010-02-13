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

-(void) dealloc
{
    [path release];
    [actions release];

    [super dealloc];
}


-(CGPoint) getPosAtTime:(int) relativeTime
{
    return [path getPosAtTime:relativeTime];
}

-(BOOL) didFirePrimaryShotAtTime:(int) relativeTime
{
    didFirePrimaryShotAtTime = NO;
    for (action in actions) {
        if ([action didFirePrimaryShotAtTime:relativeTime]) {
            didFirePrimaryShotAtTime = YES;
            break;
        }
    }
    return didFirePrimaryShotAtTime;
}
@end
