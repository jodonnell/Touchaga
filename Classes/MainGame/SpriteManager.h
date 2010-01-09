//
//  SpriteManager.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface SpriteManager : NSObject {
@public
    AtlasSpriteManager *manager;
    CGRect imageRect;
    int tag;
    int zIndex;
}

@property (retain, nonatomic) AtlasSpriteManager *manager;
@property (nonatomic) CGRect imageRect;
@property (nonatomic) int tag;
@property (nonatomic) int zIndex;

@end


@interface PlayerSpriteManager : SpriteManager {

}
@end

@interface PlayerBulletSpriteManager : SpriteManager {

}
@end

@interface WarpOutSpriteManager : SpriteManager {

}
@end

@interface BackgroundSpriteManager : SpriteManager {

}
@end
