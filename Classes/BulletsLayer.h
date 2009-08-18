//
//  BulletsLayer.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"


@interface BulletsLayer : Layer {
    NSMutableArray *onScreenPlayerBullets;
}

@property (retain, nonatomic) NSMutableArray *onScreenPlayerBullets;

-(void) addPlayerBullet:(CGPoint) pos andCharge:(int) charge;
-(void) addEnemyBullet:(CGPoint) pos andCharge:(int) charge;
-(void) moveBullet:(ccTime) dt;
-(void) removePlayerBullet: (AtlasSprite *) bulletSprite;

@end
