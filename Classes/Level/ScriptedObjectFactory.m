//
//  ScriptedObjectFactory.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScriptedObjectFactory.h"
#import "BasicEnemy.h"

@implementation ScriptedObjectFactory

+(id)initWithType:(NSString *) objectType andPattern:(Pattern *) pattern andStartTime:(int) startTime
{
    if ([objectType isEqualToString:@"basic_enemy"]) {
        return [[[BasicEnemy alloc] initWithStartTime:startTime andPattern:pattern] autorelease];
    }

    NSLog(@"Non-existant object type %@", objectType);
    return nil;
}


@end
