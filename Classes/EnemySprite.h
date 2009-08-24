//
//  EnemySprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"

/**
 * Abstract Class
 * @todo Document
 */
@interface EnemySprite : AtlasSprite {
    int hp;
}

/** The HP the enemy currently contains */
@property (nonatomic) int hp;

/**
 * Does the specified amount of damage to the enemy.
 * @param damage An int, the amount of damage done to the enemy.
 */
-(void) doDamage:(int) damage;

/**
 * Returns YES if the enemy has no hit points left else NO.
 * @return BOOL
 */
-(BOOL) isDead;

/**
 * @todo Document
 */
-(void) move: (ccTime) dt;

@end
