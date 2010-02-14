//
//  Globals.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/2/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/**
 * This is a singleton for global objects.
 */
@interface Globals : NSObject
{
    AtlasSpriteManager *playerManager;
    AtlasSpriteManager *bulletManager;
    AtlasSpriteManager *warpOutManager;
    AtlasSpriteManager *backgroundMangaer;
    AtlasSpriteManager *enemyManager;

    CGRect shootButtonRect;
}

/** The player manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *playerManager;

/** The bullet manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *bulletManager;

/** The warping out sprite manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *warpOutManager;

/** The background image manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *backgroundMangaer;

/** The enemy image manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *enemyManager;

/** The rect that holds the shoot button. */
@property (nonatomic) CGRect shootButtonRect;

/**
 * Constructor
 * @return Globals The shared instance of the singleton.
 */
+(Globals *) sharedInstance;
@end
