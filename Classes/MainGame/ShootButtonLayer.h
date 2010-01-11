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
@interface ShootButtonLayer : Layer <TargetedTouchDelegate>{
    BOOL shooting;

}

/** Returns true if shooting, false otherwise. */
@property (nonatomic) BOOL shooting;

/** 
 * Returns YES if the player is currently shooting, NO otherwise.
 */
-(BOOL) isShooting;

@end
