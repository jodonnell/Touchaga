//
//  UIShootLayer.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "PlayerSprite.h"

/** 
 * This layer contains the button that can be used to fire shots. When you hit the button
 * it begins charging energy and when you release the button it fires the bullet and creates
 * the PlayerBulletSprite.
 */
@interface UIShootLayer : Layer {
@private
    CGRect shootRect;
}

/** The CGRect that contains the area that the button is in to shoot. */
@property (nonatomic) CGRect shootRect;

/** 
 * Returns the game play scene.
 */
-(CocosNode *)getGamePlayScene;

/** 
 * Regains player energy, meant to be scheduled when a player is not charging.
 */
-(void) regainEnergy: (ccTime) dt;

/** 
 * Adds to the amount of player charged energy, meant to scheduled when a player has the shoot button pressed down.
 */
-(void) chargeShot: (ccTime) dt;

/** 
 * Returns the PlayerSprite.
 */
-(PlayerSprite *) getPlayer;

/** 
 * Starts charging a shot.
 */
- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

/** 
 * Fires the current shot, creates a PlayerBulletSprite and resets charged energy to zero.
 */
- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
