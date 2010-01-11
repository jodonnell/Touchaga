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
#import "Globals.h"

@interface WarpOutCircle()
/**
 * Converts the energy to a scale factor to scale the sprite to the correct size.
 * @return The scale factor.
 */
-(float)convertEnergyToScaleFactor;

/**
 * Gets the touchable area of the sprite.
 * @return The rect that contains the touchable area of the warp in sprite.
 */
-(CGRect)getTouchBox;

/**
 * Checks to see if the point is within the shoot button rect.
 * @return YES if the player is trying to warp into the shoot button.
 */
-(BOOL) isWarpingIntoShootButton:(CGPoint) touchPoint;

@end

@implementation WarpOutCircle

@synthesize player;
@synthesize warpIn;

-(id) initWithPlayer:(Player *) thePlayer;
{
    spriteManager = [[WarpOutSpriteManager alloc] init];
    self = [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
    [self moveTo: thePlayer.position];
    player = thePlayer;
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
    return (float)[[player warpEnergy] energy] / 300.0f;
}

-(void)drainEnergy
{
    [[player warpEnergy] removeEnergy: 1];
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
    rect.origin.x = self.position.x - rect.size.width / 2;
    rect.origin.y = self.position.y - rect.size.height / 2;
    return rect;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
     CGPoint touchPoint = [touch locationInView:[touch view]];
     touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];

     CGRect touchBox = [self getTouchBox];
     if (CGRectContainsPoint(touchBox, touchPoint) && ! [self isWarpingIntoShootButton:touchPoint]) {
	 [player warpIn:touchPoint];
	 warpIn = YES;
     }
     return NO;
}

-(BOOL) isWarpingIntoShootButton:(CGPoint) touchPoint
{
    return CGRectContainsPoint([[Globals sharedInstance] shootButtonRect], touchPoint);
}

@end

