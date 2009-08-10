
// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "KaragaSprite.h"

// HelloWorld Layer
@interface PlayerLayer : Layer
{
	BOOL moving;
}

@property (nonatomic) BOOL moving;

- (AtlasSprite *) getPlayer;

@end
