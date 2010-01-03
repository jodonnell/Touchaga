#import "cocos2d.h"
#import <Foundation/Foundation.h>

@interface Globals : NSObject
{
@public
    AtlasSpriteManager *playerManager;
    AtlasSpriteManager *bulletManager;
    // Place any "global" variables here
}

@property (retain, nonatomic) AtlasSpriteManager *playerManager;
@property (retain, nonatomic) AtlasSpriteManager *bulletManager;
// message from which our instance is obtained
+ (Globals *)sharedInstance;
@end
