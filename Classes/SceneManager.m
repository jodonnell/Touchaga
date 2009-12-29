//
//  SceneManager.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

#import "SceneManager.h"
#import "MainGameLoop.h"
#import "GameLayer.h"

@implementation SceneManager

-(id) init
{
    if( (self=[super init] )) {
	Scene *scene = 	[self initGame];
	[[Director sharedDirector] runWithScene: scene];
    }
    return self;
}

-(Scene *) initGame
{
    Scene *scene = [Scene node];
    MainGameLoop *mainGameLoop = [[MainGameLoop alloc] init];
    GameLayer *gameLayer = [mainGameLoop getGameLayer];
    AtlasSprite *shootButtonLayer = (AtlasSprite *)[mainGameLoop getShootButtonLayer];

    [scene addChild:gameLayer];
    [scene addChild:shootButtonLayer];
    [scene addChild:mainGameLoop]; // must be attached to run mainGameLoop's timer
    return scene;
}

- (void) dealloc
{
    [super dealloc];
}

@end
