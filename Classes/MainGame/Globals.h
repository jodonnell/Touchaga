//
//  Globals.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/2/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import <Foundation/Foundation.h>

/**
 * This is a singleton for global objects.
 */
@interface Globals : NSObject
{
@public
    AtlasSpriteManager *playerManager;
    AtlasSpriteManager *bulletManager;
}

/** The player manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *playerManager;

/** The bullet manager AtlasSpriteManager */
@property (retain, nonatomic) AtlasSpriteManager *bulletManager;

/**
 * Constructor
 * @return Globals The shared instance of the singleton.
 */
+ (Globals *)sharedInstance;
@end
