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
#import "WarpOutCircle.h"
#import "Globals.h"

@implementation Player

@synthesize warpEnergy;
@synthesize lives;
@synthesize invincible;
@synthesize score;
@synthesize warpPlayerOut;
@synthesize isWarpedOut;
@synthesize isGameOver;

-(id)init
{
    spriteManager = [[PlayerSpriteManager alloc] init];
    [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
    lives = 3;
    score = 0;
    warpEnergy = [[WarpEnergy alloc] init];
    warpPlayerOut = NO;
    isWarpedOut = YES;
    return [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
}

-(void) dealloc
{
    [warpEnergy release];
    [super dealloc];
}

-(CGRect)getTouchBox
{
    return CGRectMake(self.position.x - 15, self.position.y - 15, 30, 30);
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

    CGPoint touchPoint = [touch locationInView:[touch view]];
    touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];

    if (CGRectContainsPoint([self getTouchBox], touchPoint)) {
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

    if ([self isTouchInShootButton:touchPoint]) {
	self.warpPlayerOut = YES;
	[self onExit]; // only way i would find to force the touch to get dropped
	[self onEnter];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.warpPlayerOut = YES;
}

-(BOOL) isInvincible
{
    return invincible;
}

-(int) getScore
{
    return score;
}

-(void) warpOut
{
    warpPlayerOut = NO;
    isWarpedOut = YES;
}

-(void) warpIn: (CGPoint) point
{
    if ( ! [self isTouchInShootButton:point]) {
	isWarpedOut = NO;
	[self moveTo:CGPointMake(point.x, point.y)];
    }
}

-(void) addScore: (int) addScore
{
    score += addScore;
}

-(void) loseLife
{
    [warpEnergy maxOutEnergy];

    lives -= 1;
    if (lives == 0)
	isGameOver = YES;
}

-(BOOL) isOutOfWarpEnergy
{
    if ([warpEnergy energy] == 0) {
	return YES;
    }
    return NO;
}

-(BOOL) isTouchInShootButton:(CGPoint) touchPoint
{
    return CGRectContainsPoint([[Globals sharedInstance] shootButtonRect], touchPoint);
}

@end
