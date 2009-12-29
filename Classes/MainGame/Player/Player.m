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

@interface Player (private)
-(void) changeAnimation;
@end

@implementation Player (private)
-(void) changeAnimation
{

}
@end

@implementation Player

@synthesize warpEnergy;
@synthesize lives;
@synthesize invincible;
@synthesize score;

+(id)init
{
    return [[[self alloc] init] autorelease];
}

-(id)init
{
    lives = 3;
    score = 0;
//    energy = [[Energy alloc] init];
    spriteManager = [[PlayerSpriteManager alloc] init];
    NSLog(@"%@", spriteManager);
    NSLog(@"%i", spriteManager.zIndex);
    return [super initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
}

-(void) dealloc
{
//    [energy release];
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

-(WarpSprite *) warpOut
{

}

-(void) warpIn: (CGPoint) point
{

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
    PlayerBullet *playerBullet = [PlayerBullet init];
    [playerBullet moveTo:CGPointMake(20, 20)];
    return playerBullet;
}

@end
