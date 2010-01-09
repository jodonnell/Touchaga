//
//  WarpOutCircle.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.

#import "WarpOutCircle.h"
#import "Player.h"
#import "WarpEnergy.h"
#import "SpriteManager.h"

@implementation WarpOutCircle

@synthesize energy;
@synthesize player;
@synthesize warpIn;

-(id) initWithPlayer:(Player *) thePlayer;
{
    spriteManager = [[WarpOutSpriteManager alloc] init];
    self = [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
    [self moveTo: thePlayer.position];
    player = thePlayer;
    energy = [[thePlayer warpEnergy] energy];
    warpIn = NO;

    self.scale = [self convertEnergyToScaleFactor];
    self.opacity = 120;

    return self;
}

-(void) dealloc
{
    [player release];

    [super dealloc];
}

-(float)convertEnergyToScaleFactor
{
    return (float)self.energy / 600.0f;
}

-(void)drainEnergy
{
    [[player warpEnergy] removeEnergy: 1];
    energy = [[player warpEnergy] energy];
}

-(void)update
{
    self.scale = [self convertEnergyToScaleFactor];
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

-(CGRect)getTouchBox
{
    CGRect rect = spriteManager.imageRect;
    rect.size.width *= [self convertEnergyToScaleFactor];
    rect.size.height *= [self convertEnergyToScaleFactor];
    rect.origin.x -= rect.size.width / 2; 
    rect.origin.y -= rect.size.height / 2; 
    return rect;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
     CGPoint convertedPoint = [self convertTouchToNodeSpaceAR:touch];
     CGRect touchBox = [self getTouchBox];
     if (CGRectContainsPoint(touchBox, convertedPoint)) {
	 CGPoint touchPoint = [touch locationInView:[touch view]];
	 touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];
	 [player warpIn:touchPoint];
	 warpIn = YES;
     }
     return NO;
}

@end

