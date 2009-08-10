//
//  UIShootLayer.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UIShootLayer.h"
#import "defines.h"
#import "BulletsLayer.h"
#import "PlayerLayer.h"

@implementation UIShootLayer

@synthesize shootRect;

-(id) init
{
	if( (self=[super init] )) {
		self.isTouchEnabled = YES;
		
		shootRect = CGRectMake(0, 0, 30, 200);
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

-(CocosNode *) getGamePlayScene
{
	return [self parent];
}


- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
	if( touch ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		// IMPORTANT:
		// The touches are always in "portrait" coordinates. You need to convert them to your current orientation
		CGPoint convertedPoint = [[Director sharedDirector] convertCoordinate:location];
		
		if (CGRectContainsPoint(shootRect, convertedPoint))
		{
			PlayerLayer *playerLayer = (PlayerLayer *)[[self getGamePlayScene] getChildByTag:kTagPlayerLayer];
			CocosNode *player = [playerLayer getPlayer];

			BulletsLayer *bulletLayer = (BulletsLayer *)[[self getGamePlayScene] getChildByTag:kTagBulletLayer];
			[bulletLayer addPlayerBullet:player.position andCharge: 0];
		}
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

		if (CGRectContainsPoint(shootRect, convertedPoint))
		{
		}
		else 
			return kEventIgnored;
		
		// no other handlers will receive this event
		return kEventHandled;
	}
	
	// we ignore the event. Other receivers will receive this event.
	return kEventIgnored;
}

@end
