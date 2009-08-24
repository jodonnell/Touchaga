//
//  SceneManager.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"

#import "PlayerLayer.h"
#import "BulletsLayer.h"
#import "UIShootLayer.h"
#import "EnemyLayer.h"
#import "defines.h"
#import "cocos2d.h"

@implementation SceneManager

-(id) init
{
    if( (self=[super init] )) {
	Scene *scene = [Scene node];
		
	PlayerLayer *playerLayer = [PlayerLayer node];
	BulletsLayer *bulletsLayer = [BulletsLayer node];
	UIShootLayer *uiShootLayer = [UIShootLayer node];
	EnemyLayer *enemyLayer = [EnemyLayer node];

	[scene addChild:playerLayer z:0 tag:kTagPlayerLayer];
	[scene addChild:bulletsLayer z:0 tag:kTagBulletLayer];
	[scene addChild:uiShootLayer z:0 tag:kTagShootLayer];
	[scene addChild:enemyLayer z:0 tag:kTagEnemyLayer];

	[[Director sharedDirector] runWithScene: scene];
    }
    return self;
}


- (void) dealloc
{
    [super dealloc];
}

-(void) makeGameCurrentScene: (int) level
{
    [[Director sharedDirector] popScene];
}

@end
