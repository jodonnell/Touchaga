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
@class PlayerInactiveLayer;

@interface MainGameLoop : CocosNode {
@private
    GameLayer *gameLayer;
    Player *player;
    ShootButtonLayer *shootButtonLayer;
    NSMutableArray *playerBullets;
    WarpLayer *warpLayer;
    PlayerInactiveLayer *playerInactiveLayer;
}

/** A NSMutableArray that contains all the player bullet sprite objects */
@property (retain, nonatomic) NSMutableArray *playerBullets;

/** The layer that contains everything within the main game */
@property (retain, nonatomic) GameLayer *gameLayer;

/** The player object */
@property (retain, nonatomic) Player *player;

/** The layer with the shoot button on it. */
@property (retain, nonatomic) ShootButtonLayer *shootButtonLayer;

/** The warp layer. Will be nil, unless on screen. */
@property (retain, nonatomic) WarpLayer *warpLayer;

/** The inactive layer. A player can touch anywhere to warp in. Will be nil, unless on screen. */
@property (retain, nonatomic) PlayerInactiveLayer *playerInactiveLayer;

-(void) update: (ccTime) dt;

-(GameLayer *) getGameLayer;

-(ShootButtonLayer *) getShootButtonLayer;

-(void) removePlayerBullet: (PlayerBullet *) playerBullet;

// private
-(void) updatePlayerBullets;
-(void) shootBullet;
-(void) warpPlayerOut;
-(void) drainPlayerWarpEnergy;
-(void) warpPlayerIn;
-(BOOL) isPlayerWarpingIn;
-(BOOL) isShooting;
-(void) drawWarpMeter;

@end
