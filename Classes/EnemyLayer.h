//
//  EnemyLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "EnemySprite.h"
#import "PawnSprite.h"

@class PlayerBulletSprite;

@interface EnemyLayer : Layer {
@private
    NSMutableArray *enemies;
}

/** A NSMutableArray that contains all the enemies */
@property (retain, nonatomic) NSMutableArray *enemies;

/**
 * @todo Document
 */
-(void) addEnemy:(EnemySprite *) enemySprite;

/**
 * Checks to see if any enemy collides with the given bullet. Also has the side effect
 * of doing damage to the enemy and removing the enemy if the enemy is dead.
 * @param bulletSprite The PlayerBulletSprite to check all enemies against.
 * @return BOOL Returns YES if they collide else NO.
 */
-(BOOL) checkForBulletEnemyCollision:(PlayerBulletSprite *)bulletSprite;

/**
 * Removes the given EnemySprite from both the layer and the enemies array.
 * @param enemySprite An EnemySprite to be removed.
 */
-(void) removeEnemy: (EnemySprite *) enemySprite;

@end
