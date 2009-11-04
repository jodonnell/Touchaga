//
//  Player.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerSprite.h"
#import "ShieldLayer.h"
#import "PlayerLayer.h"

@implementation PlayerSprite

@synthesize energy;
@synthesize lives;
@synthesize moving;

-(id)initWithRect:(CGRect)rect spriteManager:(AtlasSpriteManager*)manager
{
    lives = 3;
    energy = [[Energy alloc] init];
    moving = NO;
    return [super initWithRect:rect spriteManager:manager];
}

-(void) dealloc
{
    [energy release];
    [super dealloc];
}

-(CGRect)getTouchBox
{
    return CGRectMake(-15, -15, 30, 30);
}

-(int) fire
{
    return [energy releaseChargedEnergy];
}

-(BOOL) hasEnoughEnergy: (int) charge
{
    return [energy hasEnoughEnergy: charge];
}

-(void) chargingEnergy: (int) charge
{
    [energy chargingEnergy: charge];
    [self updateShieldStrength];
}

-(void) regainEnergy: (int) energyToRegain
{
    [energy regainEnergy:energyToRegain];
    [self updateShieldStrength];
}

-(CocosNode *) getPlayerLayer
{
    return [[self parent] parent];
}

-(ShieldLayer *) getShieldLayer
{
    PlayerLayer *playerLayer = (PlayerLayer *)[self getPlayerLayer];
    ShieldLayer *shieldLayer = [playerLayer getShield];
    return shieldLayer;
}

-(void) updateShieldStrength
{
    ShieldLayer *shieldLayer = [self getShieldLayer];
    [shieldLayer setShieldStrengthByEnergy:energy.unchargedEnergy];
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
    if (moving == YES)
	return NO;
    
    CGPoint convertedPoint = [self convertTouchToNodeSpaceAR:touch];
    if (CGRectContainsPoint([self getTouchBox], convertedPoint)) {
	moving = YES;
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

    ShieldLayer *shieldLayer = [self getShieldLayer];
    shieldLayer.pos = CGPointMake(touchPoint.x, touchPoint.y);
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    moving = NO;
}


@end
