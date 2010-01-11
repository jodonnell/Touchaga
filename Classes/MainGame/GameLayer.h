//
//  GameLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class TouchagaSprite;
@class PlayerBullet;
@class WarpOutCircle;

/**
 * This layer contains all the objects in the main game.
 */
@interface GameLayer : Layer {

}

/**
 * Add a sprite to the game layer.
 * @param sprite The sprite to add to the game layer.
 */
-(void) addSpriteToLayer:(TouchagaSprite *) sprite;

/**
 * Removes the given PlayerBullet from the game layer.
 * @param The PlayerBullet to remove.
 */
-(void) removePlayerBullet: (PlayerBullet *) playerBullet;

/**
 * Removes the warp out circle sprite from the game layer.
 * @param The WarpOutCircle to remove from the game layer.
 */
-(void) removeWarpOutCircle: (WarpOutCircle *) warpOutCircle;

@end

