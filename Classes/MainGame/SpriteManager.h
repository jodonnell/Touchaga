//
//  SpriteManager.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

/** 
 * This abstract class is the glue between sprites and the AtlasSpriteManager.  Each sprite will hold one,
 * that tells the sprite which AtlasSpriteManager it uses as well as its zIndex, tag, and rect to find the image
 * within the sprite sheet.
 */
@interface SpriteManager : NSObject {
    AtlasSpriteManager *manager;
    CGRect imageRect;
    int tag;
    int zIndex;
}

/** The AtlasSpriteManager that contains the sprite. */
@property (retain, nonatomic) AtlasSpriteManager *manager;

/** The rect to find the image within the sprite sheet. */
@property (nonatomic) CGRect imageRect;

/** The tag for the sprite that will be attached to the game layer. */
@property (nonatomic) int tag;

/** The z index for when attaching to the game layer. */
@property (nonatomic) int zIndex;

@end


/** 
 * The Player's sprite manager.
 */
@interface PlayerSpriteManager : SpriteManager {

}
@end

/** 
 * Player bullet's sprite manager.
 */
@interface PlayerBulletSpriteManager : SpriteManager {

}
@end

/** 
 * The warp out sprite manager.
 */
@interface WarpOutSpriteManager : SpriteManager {

}
@end

/** 
 * The background's sprite manager.
 */
@interface BackgroundSpriteManager : SpriteManager {

}
@end
