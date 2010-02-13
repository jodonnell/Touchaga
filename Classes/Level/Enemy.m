//
//  Enemy.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"
#import "Path.h"

@implementation Enemy

@synthesize path;

-(id)init
{
    if( (self=[super init] )) {
        path = [[Path alloc] init];
    }

    return self;
}

@end
