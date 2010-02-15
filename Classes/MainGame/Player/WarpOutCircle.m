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
#import "GameLayer.h"

@interface WarpOutCircle()
/**
 * Converts the energy to a scale factor to scale the sprite to the correct size.
 * @return The scale factor.
 */
-(float)convertEnergyToScaleFactor;

/**
 * Gets the touchable area of the sprite.
 * @param touchPoint The point to test if it is within the circle.
 * @return YES if the touch is in the warp in circle.
 */
-(BOOL)isTouchInWarpCircle:(CGPoint) touchPoint;

/**
 * Checks to see if the point is within the shoot button rect.
 * @return YES if the player is trying to warp into the shoot button.
 */
-(BOOL) isWarpingIntoShootButton:(CGPoint) touchPoint;

@end

@implementation WarpOutCircle

@synthesize player;

-(id) initWithPlayer:(Player *) thePlayer;
{
    [self setSpriteManager: [[WarpOutSpriteManager alloc] init]];
    self = [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
    [self setPlayer: thePlayer];

    self.scale = [self convertEnergyToScaleFactor];
    self.opacity = 120;

    return self;
}

-(void) removePlayer
{
    [player release];
}

-(void) dealloc
{
    [super dealloc];
}

-(void)startWarpOut:(CGPoint) warpInPoint
{
    [self moveTo: warpInPoint];
}

-(float)convertEnergyToScaleFactor
{
    return (float)[[player warpEnergy] energy] / 300.0f;
}

-(void)updateScaleFactor
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

-(BOOL)isTouchInWarpCircle:(CGPoint) touchPoint
{
    int diameter = spriteManager.imageRect.size.width * [self convertEnergyToScaleFactor];
    int radius = diameter / 2;
    int lefCoordOfCircle = self.position.x - radius;
    int topCoordOfCircle = self.position.y - radius;
    BOOL xInBounds = (touchPoint.x > lefCoordOfCircle) && (touchPoint.x < lefCoordOfCircle + diameter);
    BOOL yInBounds =  (touchPoint.y > topCoordOfCircle) && (touchPoint.y < topCoordOfCircle + diameter);

    int xDistance = abs(self.position.x - touchPoint.x);
    int yDistance = abs(self.position.y - touchPoint.y);

    int lineLength = sqrt(pow(xDistance, 2) + pow(yDistance, 2));

    if (xInBounds && yInBounds && (lineLength <= radius))
        return YES;
    return NO;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
     CGPoint touchPoint = [touch locationInView:[touch view]];
     touchPoint = [[Director sharedDirector] convertCoordinate:touchPoint];

     if ([self isTouchInWarpCircle:touchPoint] && ! [self isWarpingIntoShootButton:touchPoint]) {
         [player warpIn:touchPoint];
     }
     return NO;
}

-(BOOL) isWarpingIntoShootButton:(CGPoint) touchPoint
{
    return CGRectContainsPoint([[Globals sharedInstance] shootButtonRect], touchPoint);
}

@end

