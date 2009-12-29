//
//  ShootButtonLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

/** 
 * This layer contains the button that can be used to fire shots. When you hit the button
 * it begins charging energy and when you release the button it fires the bullet and creates
 * the PlayerBulletSprite.
 */
@interface ShootButtonLayer : Layer {
    BOOL shooting;

}

/** Returns true if shooting, false otherwise. */
@property (nonatomic) BOOL shooting;


/** 
 * Returns YES if the player is currently shooting, NO otherwise.
 */
-(BOOL) isShooting;

/** 
 * Returns the rect where the shoot button lies in.
 */
-(CGRect) getButtonRect;

/** 
 * Starts charging a shot.
 */
- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

/** 
 * Fires the current shot, creates a PlayerBulletSprite and resets charged energy to zero.
 */
- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end
