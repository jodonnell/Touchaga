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
#import "Globals.h"
#import "WarpOutCircle.h"
#import "GameLayer.h"
#import "PlayerInactiveLayer.h"

enum {
    kPlayerFireRate = 2,
};

@implementation Player

@synthesize warpEnergy;
@synthesize lives;
@synthesize invincible;
@synthesize score;
@synthesize isWarpedOut;
@synthesize isGameOver;
@synthesize bulletCoolDown;
@synthesize canShoot;
@synthesize warpOutCircle;
@synthesize inactiveLayer;

-(id)init
{
    spriteManager = [[PlayerSpriteManager alloc] init];
    self = [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
    lives = 3;
    score = 0;
    warpEnergy = [[WarpEnergy alloc] init];
    isWarpedOut = YES;
    canShoot = YES;
    bulletCoolDown = 0;
    warpOutCircle = [[WarpOutCircle alloc] initWithPlayer:self];
    inactiveLayer = [[PlayerInactiveLayer alloc] initWithPlayer:self];
    return self;
}

-(void) deactivate
{
    [[GameLayer sharedInstance] addInactiveLayer:inactiveLayer];
}

-(void) dealloc
{
    [warpEnergy release];
    [warpOutCircle release]; // dangerous loop
    
    [super dealloc];
}

-(void) removePlayer
{
    [warpOutCircle removePlayer];
}

-(void) playerDrainEnergy
{
    [warpEnergy removeEnergy: 1];
    [warpOutCircle updateScaleFactor];
}

-(void) warpOut
{
    if ([[GameLayer sharedInstance] isInactiveLayerOn])
        return;

    [warpOutCircle startWarpOut:self.position];
    isWarpedOut = YES;
    [[GameLayer sharedInstance] addSpriteToLayer: (TouchagaSprite *)warpOutCircle];
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
        [self moveTo:ccp(touchPoint.x, touchPoint.y)];
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
        [self warpOut];
        [self onExit]; // only way i would find to force the touch to get dropped
        [self onEnter];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self warpOut];
}

-(BOOL) isInvincible
{
    return invincible;
}

-(void) warpIn: (CGPoint) point
{
    if ( ! [self isTouchInShootButton:point]) {
        isWarpedOut = NO;
        [self moveTo:CGPointMake(point.x, point.y)];
        [self removeWarps];
    }
}

-(void) removeWarps
{
    [[GameLayer sharedInstance] removeWarpOutCircle:warpOutCircle];
    [[GameLayer sharedInstance] removeInactiveLayer:inactiveLayer];
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

    [self removeWarps];
    [self deactivate];
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

-(void) shootBullet
{
    canShoot = NO;
    bulletCoolDown = 0;
}

-(void) incrementBulletCoolDown
{
    bulletCoolDown++;
}

-(BOOL) canShoot
{
    if (bulletCoolDown > kPlayerFireRate) {
        canShoot = YES;
        bulletCoolDown = 0;
    }

    return canShoot;
} 


@end
