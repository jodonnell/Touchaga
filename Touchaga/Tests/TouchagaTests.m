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
#import "MainGameLoop.h"
#import "WarpEnergy.h"
#import "Globals.h"

@implementation TouchagaTests
@synthesize player;

- (void) setUp
{
    [self setPlayer: [[Player alloc] init]];
}

- (void) tearDown
{
    [player release];
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

-(void) testWarpIn
{
    [player moveTo:ccp(60,60)];
    [player warpIn:ccp(100, 100)];
    STAssertEquals([player position], ccp(100, 100), @"Player warpIn did not set player.");
    
    [player warpOut];
    [player warpIn:ccp(0, 0)];
    STAssertEquals([player position], ccp(100, 100), @"Player warpIn warped the player into the shoot button.");
}

-(void) testScore
{
    [player addScore:20];
    STAssertEquals([player score], 20, @"Player score was not set.");
}

-(void) testLoseLife
{
    STAssertFalse([player isGameOver], @"Should not be player game over.");
    int lives = [player lives];
    while ([player lives]) {
	[player loseLife];
	STAssertEquals([player lives], lives - 1, @"Player did not lose life.");
	lives--;
    }
    STAssertTrue([player isGameOver], @"Should be player game over.");
}


-(void) testMain
{
    MainGameLoop *mainGameLoop = [[MainGameLoop alloc] init];
    
}

@end


/*
 * Overide all touch functions with categories, isShooting 
*/
