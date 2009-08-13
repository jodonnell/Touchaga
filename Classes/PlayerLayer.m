// Import the interfaces
#import "PlayerLayer.h"

enum {
	kTagPlayer = 1,
	kTagSpriteManager = 2,
};

@implementation PlayerLayer

@synthesize moving;

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		// isTouchEnabled is an property of Layer (the super class).
		// When it is YES, then the touches will be enabled
		self.isTouchEnabled = YES;
		
		AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:1];
		[self addChild:mgr z:0 tag:kTagSpriteManager];

		PlayerSprite *sprite = [PlayerSprite spriteWithRect:CGRectMake(0,0,16,16) spriteManager:mgr];
		sprite.position = ccp( 100, 150);
		[mgr addChild:sprite z:0 tag:kTagPlayer];

		[self schedule: @selector(regainEnergy:) interval:0];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (BOOL)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	if( touch && moving == YES) {
		CGPoint location = [touch locationInView: [touch view]];
		
		// IMPORTANT:
		// The touches are always in "portrait" coordinates. You need to convert them to your current orientation
		CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];
		
		AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
		PlayerSprite *sprite = (PlayerSprite *)[mgr getChildByTag:kTagPlayer];

		sprite.position = convertedPoint;
		
		// no other handlers will receive this event
		return kEventHandled;
	}
	
	// we ignore the event. Other receivers will receive this event.
	return kEventIgnored;
}

- (PlayerSprite *) getPlayer
{
	AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
	PlayerSprite *sprite = (PlayerSprite *)[mgr getChildByTag:kTagPlayer];
	return sprite;
}

- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	if( touch ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		// IMPORTANT:
		// The touches are always in "portrait" coordinates. You need to convert them to your current orientation
		CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];
		
		AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
		PlayerSprite *sprite = (PlayerSprite *)[mgr getChildByTag:kTagPlayer];
		if (CGRectContainsPoint([sprite getSpriteRect], convertedPoint))
			moving = NO;
		else
			return kEventIgnored;
		
		// no other handlers will receive this event
		return kEventHandled;
	}
	
	// we ignore the event. Other receivers will receive this event.
	return kEventIgnored;
}

- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	if( touch ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		// IMPORTANT:
		// The touches are always in "portrait" coordinates. You need to convert them to your current orientation
		CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];

		AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
		PlayerSprite *sprite = (PlayerSprite *)[mgr getChildByTag:kTagPlayer];
		if (CGRectContainsPoint([sprite getSpriteRect], convertedPoint))
			moving = YES;
		else 
			return kEventIgnored;
		
		// no other handlers will receive this event
		return kEventHandled;
	}
	
	// we ignore the event. Other receivers will receive this event.
	return kEventIgnored;
}

-(void) regainEnergy: (ccTime) dt
{
    AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
    PlayerSprite *sprite = (PlayerSprite *)[mgr getChildByTag:kTagPlayer];
    [sprite regainEnergy:1];
}

@end
