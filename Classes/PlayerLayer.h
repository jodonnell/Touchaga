
// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "PlayerSprite.h"
#import "ShieldLayer.h"

// HelloWorld Layer
@interface PlayerLayer : Layer
{
}

-(PlayerSprite *) getPlayer;
-(ShieldLayer *) getShield;

@end
