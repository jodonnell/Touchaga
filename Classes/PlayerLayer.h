
// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "PlayerSprite.h"

// HelloWorld Layer
@interface PlayerLayer : Layer
{
    BOOL moving;
}

@property (nonatomic) BOOL moving;

-(PlayerSprite *) getPlayer;
-(void) regainEnergy: (ccTime) dt;

@end
