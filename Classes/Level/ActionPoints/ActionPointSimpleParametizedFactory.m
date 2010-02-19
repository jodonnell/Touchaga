//
//  ActionPointSimpleParametizedFactory.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ActionPointSimpleParametizedFactory.h"

@implementation ActionPointSimpleParametizedFactory

+(id)initWithType:(NSString *) objectType andArguments:(NSMutableArray *)arguments andArgConverter:(SQLArgConverter *)argConverter
{
    if ([objectType isEqualToString:@"simple_bullet"]) {
        ActionPoint *ap =  [[[ShootSimpleBullet alloc] initWithArgs:arguments andArgConverter:argConverter] autorelease];
    }


    

    NSLog(@"Non-existant object type %@", objectType);
    return nil;
}


// i need to get unknown amount of args into ok don.

@end

