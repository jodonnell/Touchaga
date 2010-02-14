//
//  Enemy.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"
#import "Pattern.h"

@implementation Enemy

@synthesize pattern;
@synthesize startTime;

-(id)initWithStartTime:(int) inStartTime andPattern:(Pattern *) inPattern
{
    if( (self=[super init] )) {
        pattern = inPattern;
        startTime = inStartTime;
    }
    return self;
}

-(int) getRelativeTime:(int) currentTime
{
    return currentTime - startTime;
}

-(void)moveToAtTime:(int) currentTime
{
    int relativeTime = [self getRelativeTime:currentTime];
    [self moveTo:[pattern getPosAtTime:relativeTime]];
}

-(void)doActionsAtTime:(int) currentTime
{
    int relativeTime = [self getRelativeTime:currentTime];
    NSMutableArray *actions = [pattern getActionsAtTime:relativeTime];

    for (action in actions) {
        if ([action isActionPrimaryShoot])
            [self primaryShoot];
    }
}

-(void) primaryShoot
{
}

@end
