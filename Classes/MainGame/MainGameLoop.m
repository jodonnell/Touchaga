//
//  MainGameLoop.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainGameLoop.h"
#import "GameLayer.h"

@implementation MainGameLoop

@synthesize gameLayer;
@synthesize player;

-(id) init
{
    if( (self=[super init] )) {
	gameLayer = [[GameLayer alloc] init];
	player = [gameLayer createPlayer];
    }
    
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

-(void) update
{

}

-(GameLayer *) getGameLayer
{
    return gameLayer;
}

@end
