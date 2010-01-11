//
//  PlayerBullet.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "TouchagaSprite.h"

/**
 * The sprite for all the player bullets.
 */
@interface PlayerBullet : TouchagaSprite {

}

/**
 * Updates the player bullets position.
 */
-(void) update;

/**
 * Checks to see if the player bullet is no longer on the screen.
 * @param YES if the player bullet is off screen.
 */
-(BOOL) isOffScreen;

@end
