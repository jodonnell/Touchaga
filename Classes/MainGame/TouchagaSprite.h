//
//  TouchagaSprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class SpriteManager;

/**
 * A subclass of AtlasSprite, adds some functionality for the sprites in this game.
 */
@interface TouchagaSprite : AtlasSprite {
    SpriteManager *spriteManager;
}

/** The sprite manager for all the player related images. */
@property (retain, nonatomic) SpriteManager *spriteManager;

/**
 * Moves the sprite to the position at point.
 * @param point The point to move the player to.
 */
-(void) moveTo: (CGPoint) point;

/**
 * Makes a rect that fits the sprite object.
 * @return The rect that fits the sprite object.
 */
-(CGRect) makeRect;

/**
 * Checks to see if the player bullet is no longer on the screen.
 * @param YES if the player bullet is off screen.
 */
-(BOOL) isOffScreen;

@end
