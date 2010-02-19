//
//  Enemy.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

@synthesize hp;

-(void) getHit
{
    hp--;
}

-(BOOL) isDead
{
    if (hp < 1)
        return YES;
    return NO;
}

@end
