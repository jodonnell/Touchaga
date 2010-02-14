//
//  PatternableObjectFactory.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PatternableObjectFactory.h"
#import "BasicEnemy.h"

@implementation PatternableObjectFactory

+(id)initWithType:(NSString *) objectType andPattern:(Pattern *) pattern andStartTime:(int) startTime
{
    if( (self=[super init] )) {
        if (objectType == @"basic_enemy")
            return [[BasicEnemy alloc] initWithStartTime:startTime andPattern:pattern];
    }

    // throw error
}


@end
