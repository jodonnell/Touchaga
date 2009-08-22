//
//  PlayerLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "PlayerSprite.h"
#import "ShieldLayer.h"

/**
 * The layer that contains the PlayerSprite and the ShieldLayer, and anything else to do with the player.
 */
@interface PlayerLayer : Layer
{
}

/**
 * Gets the player sprite.
 * @return The PlayerSprite object.
 */
-(PlayerSprite *) getPlayer;

/**
 * Returns the shield layer.
 * @return The ShieldLayer object.
 */
-(ShieldLayer *) getShield;

@end
