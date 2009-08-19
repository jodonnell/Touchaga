// Import the interfaces
#import "PlayerLayer.h"
#import "ShieldLayer.h"

enum {
    kTagPlayer = 1,
    kTagSpriteManager = 2,
    kTagShield = 3,
};

@implementation PlayerLayer

-(id) init
{
    if( (self=[super init] )) {
	self.isTouchEnabled = YES;
		
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:1];
	[self addChild:mgr z:0 tag:kTagSpriteManager];

	PlayerSprite *sprite = [PlayerSprite spriteWithRect:CGRectMake(0,0,16,16) spriteManager:mgr];
	sprite.position = ccp(100, 150);
	[mgr addChild:sprite z:0 tag:kTagPlayer];

	ShieldLayer *shieldLayer = [ShieldLayer node];
	shieldLayer.pos = ccp(100, 150);
	[self addChild:shieldLayer z:0 tag:kTagShield];

    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}


- (PlayerSprite *) getPlayer
{
    AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
    PlayerSprite *sprite = (PlayerSprite *)[mgr getChildByTag:kTagPlayer];
    return sprite;
}

- (ShieldLayer *) getShield
{
    return (ShieldLayer *)[self getChildByTag:kTagShield];
}

@end
