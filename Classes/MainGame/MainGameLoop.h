//
//  MainGameLoop.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class GameLayer;
@class Player;
@class ShootButtonLayer;
@class PlayerBullet;
@class WarpLayer;

@interface MainGameLoop : CocosNode {
@private
    GameLayer *gameLayer;
    Player *player;
    ShootButtonLayer *shootButtonLayer;
    NSMutableArray *playerBullets;
    WarpLayer *warpLayer;
}

/** A NSMutableArray that contains all the player bullet sprite objects */
@property (retain, nonatomic) NSMutableArray *playerBullets;

/** The layer that contains everything within the main game */
@property (retain, nonatomic) GameLayer *gameLayer;

/** The player object */
@property (retain, nonatomic) Player *player;

/** The layer with the shoot button on it. */
@property (retain, nonatomic) ShootButtonLayer *shootButtonLayer;

/** The warp layer. */
@property (retain, nonatomic) WarpLayer *warpLayer;


-(void) update: (ccTime) dt;

-(GameLayer *) getGameLayer;

-(ShootButtonLayer *) getShootButtonLayer;

-(void) removePlayerBullet: (PlayerBullet *) playerBullet;

@end
