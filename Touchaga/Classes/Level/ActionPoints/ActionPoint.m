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

@synthesize args;

-(id)initWithArgs:(NSMutableArray *) arguments andArgConverter:argConverter;
{
    if( (self=[super init] )) {
        NSArray *argTypes = [self getArgTypes];
        for (int i = 0; [args count]; i++) {
            if ([[argTypes objectAtIndex:i] isEqualToString:@"int")
                [args addObject: [argConverter genNumFromField:[args objectAtIndex:i] type:[argTypes objectAtIndex:i]];
        }
    }

    return self;
}

-(void) dealloc
{
    [action release];

    [super dealloc];
}

-(void) execute:(ScriptedObject *) scriptedObject
{
}

-(BOOL) isActionPointPrimaryShoot
{
    if (action == ACTION_PRIMARY_SHOOT)
        return YES;
    return NO;
}

@end
