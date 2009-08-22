//
//  BulletsLayer.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"

/**
 * The layer which contains all the bullets on screen.
 */
@interface BulletsLayer : Layer {
    NSMutableArray *playerBullets;
}

/** A NSMutableArray that contains all the player bullet sprite objects */
@property (retain, nonatomic) NSMutableArray *playerBullets;

/**
 * Creates a PlayerBulletSprite and adds it to the screen at the given position.
 * @param pos A CGPoint that determines the starting position of the PlayerBulletSprite.
 * @param charge An int that sets the level of charge for the bullet.
 */
-(void) addPlayerBullet:(CGPoint) pos andCharge:(int) charge;

/**
 * 
 * 
 * 
 */
-(void) addEnemyBullet:(CGPoint) pos andCharge:(int) charge;

/**
 * A scheduled method that moves all the PlayerBulletSprites by a constant rate
 * @param dt A ccTime object that contains the number of seconds since the last frome (?).
 * @todo Confirm the param description is correct.
 */
-(void) moveBullet:(ccTime) dt;

/**
 * Given a PlayerBulletSprite object, removes it from the screen and deletes it.
 * @param a PlayerBulletSprite to remove from the game.
 */
-(void) removePlayerBullet: (AtlasSprite *) bulletSprite;

@end
