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
 * Depending on how big the charge is, uses a different graphic.
 * @param manager The bullet sprites AtlasSpriteManager.
 * @return Returns the PlayerBulletSprite instantiation.
 */
-(id)init;

-(void) moveTo: (CGPoint) point;


@end
