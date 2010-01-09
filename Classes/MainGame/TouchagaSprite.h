//
//  TouchagaSprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class SpriteManager;

@interface TouchagaSprite : AtlasSprite {
@public
    SpriteManager *spriteManager;
}

/** The sprite manager for all the player related images. */
@property (retain, nonatomic) SpriteManager *spriteManager;

/**
 * Moves the sprite to the position at point.
 * @param point The point to move the player to.
 */
-(void) moveTo: (CGPoint) point;

@end
