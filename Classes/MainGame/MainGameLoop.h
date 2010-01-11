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
@class WarpOutCircle;
@class PlayerInactiveLayer;
@class Background;

/**
 * This class holds orchestrates the flow of the game.
 * It is responsible for controlling what goes on and off the GameLayer.
 * It also controls updating all the different components and interacting between them.
 */
@interface MainGameLoop : CocosNode {
    GameLayer *gameLayer;
    Player *player;
    ShootButtonLayer *shootButtonLayer;
    NSMutableArray *playerBullets;
    WarpOutCircle *warpOutCircle;
    PlayerInactiveLayer *playerInactiveLayer;
    Background *background;
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
@property (retain, nonatomic) WarpOutCircle *warpOutCircle;

/** The inactive layer. A player can touch anywhere to warp in. Will be nil, unless on screen. */
@property (retain, nonatomic) PlayerInactiveLayer *playerInactiveLayer;

/** The background. */
@property (retain, nonatomic) Background *background;

/** 
 * Called every frame, does all the updating for the game.
 */
-(void) update: (ccTime) dt;

/** 
 * Returns the GameLayer.
 * @return GameLayer The game layer.
 */
-(GameLayer *) getGameLayer;

/** 
 * Returns the shoot button layer.
 */
-(ShootButtonLayer *) getShootButtonLayer;

@end
