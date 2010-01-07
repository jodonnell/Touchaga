//
//  PlayerInactiveLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.

#import "cocos2d.h"
#import "TouchagaSprite.h"

@class Player;

@interface PlayerInactiveLayer : ColorLayer {
    BOOL warpIn;
    Player *player;
}

@property (nonatomic) BOOL warpIn;
@property (retain, nonatomic) Player *player;

-(id) initWithPlayer:(Player *) thePlayer;

@end

