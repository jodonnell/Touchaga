//
//  Player.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "PlayerBullet.h"
#import "SpriteManager.h"
#import "WarpEnergy.h"
#import "WarpLayer.h"

@implementation Player

@synthesize warpEnergy;
@synthesize lives;
@synthesize invincible;
@synthesize score;
@synthesize warpPlayerOut;
@synthesize isWarpedOut;
@synthesize isDead;

-(id)init
{
    lives = 3;
    score = 0;
    warpEnergy = [[WarpEnergy alloc] init];
    spriteManager = [[PlayerSpriteManager alloc] init];
    warpPlayerOut = NO;
    isWarpedOut = NO;
    return [super initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
}

-(void) dealloc
{
    [warpEnergy release];
    [super dealloc];
}

-(CGRect)getTouchBox
{
    return CGRectMake(-15, -15, 30, 30);
}

- (void)onEnter
{
    [[TouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

- (void)onExit
{
    [[TouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}	

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (isWarpedOut)
	return NO;
    
    CGPoint convertedPoint = [self convertTouchToNodeSpaceAR:touch];
    if (CGRectContainsPoint([self getTouchBox], convertedPoint)) {
	return YES;
    }
    else 
	return NO;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
    touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];
    [self moveTo:CGPointMake(touchPoint.x, touchPoint.y)];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.warpPlayerOut = YES;
}

-(void) moveTo: (CGPoint) point
{
    self.position = point;
}

-(BOOL) isInvincible
{
    return invincible;
}

-(BOOL) isDead
{
    return YES;
}

-(int) getScore
{
    return score;
}

-(WarpLayer *) warpOut
{
    warpPlayerOut = NO;
    isWarpedOut = YES;
    return [[WarpLayer alloc] initWithPlayer:self];
}

-(void) warpIn: (CGPoint) point
{
    isWarpedOut = NO;
    [self moveTo:CGPointMake(point.x, point.y)];
}

-(void) addScore: (int) addScore
{
    score += addScore;
}

-(void) loseLife
{
    lives -= 1;
}

-(PlayerBullet *) shoot
{
    PlayerBullet *playerBullet = [[PlayerBullet alloc] init];
    [playerBullet moveTo:CGPointMake(20, 20)];
    return playerBullet;
}

-(BOOL) isOutOfWarpEnergy
{
    if ([warpEnergy energy] == 0) {
	isDead = YES;
	return YES;
    }
    return NO;
}

@end
