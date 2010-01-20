//
//  TouchagaTests.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TouchagaTests.h"

#import "Player.h"
#import "cocos2d.h"

@implementation TouchagaTests
@synthesize player;

- (void) setUp
{
    [self setPlayer: [[Player alloc] init]];
}

- (void) testPlayerGameOver
{
    STAssertEquals([player isGameOver], NO, @"Player started out dead.");
}

- (void) testPlayerSetPos
{
    [player moveTo:ccp(60,60)];
    STAssertEquals([player position], ccp(60, 60), @"Player setMove did not set player.");
}

@end
