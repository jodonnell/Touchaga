//
//  Player.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

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

-(id)initWithRect:(CGRect)rect spriteManager:(AtlasSpriteManager*)manager
{
    NSLog(@"Start");
    lives = 3;
//    energy = [[Energy alloc] init];
    return [super initWithRect:rect spriteManager:manager];
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
    NSLog(@"ih");
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
    self.position = CGPointMake(touchPoint.x, touchPoint.y);
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{

}

-(void) moveTo: (CGPoint) point
{

}

-(BOOL) isInvincible
{
    return YES;
}

-(BOOL) isDead
{
    return YES;
}

-(int) getScore
{
    return 0;
}

-(WarpSprite *) warpOut
{

}

-(void) warpIn: (CGPoint) point
{

}

-(void) addScore: (int) addScore
{

}

-(void) loseLife
{

}

-(PlayerBullet *) shoot
{

}

@end
