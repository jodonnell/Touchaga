//
//  ScriptedObject.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScriptedObject.h"
#import "Pattern.h"
#import "ActionPoint.h"

@implementation ScriptedObject

@synthesize pattern;
@synthesize startTime;

-(id)initWithStartTime:(int) inStartTime andPattern:(Pattern *) inPattern andRect:(CGRect) rect andManager:(AtlasSpriteManager *) manager
{
    self = [self initWithRect:rect spriteManager:manager];
    pattern = inPattern;
    startTime = inStartTime;
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

-(void)doActionPointsAtTime:(int) currentTime
{
    int relativeTime = [self getRelativeTime:currentTime];
    NSMutableArray *actions = [pattern getActionPointsAtTime:relativeTime];

    ActionPoint *action;
    for (action in actions) {
        if ([action isActionPointPrimaryShoot])
            [self primaryShoot];
    }
}

-(void) primaryShoot
{
}

@end
