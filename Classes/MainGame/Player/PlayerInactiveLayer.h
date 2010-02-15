//
//  PlayerInactiveLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.

#import "cocos2d.h"
#import "TouchagaSprite.h"

@class Player;

/**
 * A layer active when the player is in the inactive state.  This happens 
 * when the player starts a new level or after he dies.
 */
@interface PlayerInactiveLayer : ColorLayer {
    Player *player;
}

/** 
 * The Player object, needed so when the layer is touched it can tell the player where to warp in 
 * before the player touch delegate picks up the event.
 */
@property (retain, nonatomic) Player *player;

/**
 * Constructor
 * @param thePlayer The Player object.
 * @return id The PlayerInactiveLayer
 */
-(id) initWithPlayer:(Player *) thePlayer;

@end

