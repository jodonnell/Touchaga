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
@class PlayerInactiveLayer;
@class ScriptedObject;

/**
 * This layer contains all the objects in the main game.
 */
@interface GameLayer : Layer {

}

/**
 * Constructor
 * @return GameLayer The shared instance of the singleton.
 */
+(GameLayer *) sharedInstance;

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

/**
 * @return YES if the inactiveLayer is currently on.
 */
-(BOOL) isInactiveLayerOn;

/**
 * Adds the inactiveLayer.
 * @param The inactive layer.
 */
-(void) addInactiveLayer: (PlayerInactiveLayer *) inactiveLayer;

/**
 * Removes the inactive layer, but only if it is active!
 * @param The inactive layer.
 */
-(void) removeInactiveLayer: (PlayerInactiveLayer *) inactiveLayer;

/**
 * Removes the given scripted object.
 * @param The given scripted object to remove.
 */
-(void) removeScriptedObject: (ScriptedObject *) scriptedObject;

@end

