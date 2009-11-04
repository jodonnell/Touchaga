//
//  KaragaSprite.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"
#import "cocos2d.h"

/** 
 * A category to the AtlasSprite, adds functionality common to all the game sprites.
 */
@interface AtlasSprite (TouchagaSprite)

/** 
 * Returns the rect that contains the sprite.
 * @return A CGRect that contains the sprite.
 */
-(CGRect) getSpriteRect;

@end
