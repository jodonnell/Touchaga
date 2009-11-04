//
//  PlayerBulletSprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"

/**
 * The sprite for all the player bullets.
 */
@interface PlayerBulletSprite :  AtlasSprite {
    int charge;
}


/** The amount of charge that the bullet carries. */
@property (nonatomic) int charge;

/**
 * Constructor
 * @param initCharge The charge of the current shot.
 * @param manager The bullet sprites AtlasSpriteManager.
 * @return Returns the PlayerBulletSprite instantiation.
 */
+(id)initWithCharge:(int)initCharge spriteManager:(AtlasSpriteManager*)manager;

/**
 * Depending on how big the charge is, uses a different graphic.
 * @param initCharge The charge of the current shot.
 * @param manager The bullet sprites AtlasSpriteManager.
 * @return Returns the PlayerBulletSprite instantiation.
 */
-(id)initWithCharge:(int)initCharge spriteManager:(AtlasSpriteManager*)manager;

@end
