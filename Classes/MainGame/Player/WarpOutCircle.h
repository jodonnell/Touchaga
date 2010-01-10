//
//  WarpOutCircle.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.


#import "cocos2d.h"
#import "TouchagaSprite.h"

@class Player;

@interface WarpOutCircle : TouchagaSprite <TargetedTouchDelegate> {
@private 
    BOOL warpIn;
    int energy;
    Player *player;
}

@property (nonatomic) BOOL warpIn;
@property (nonatomic) int energy;
@property (retain, nonatomic) Player *player;

-(id) initWithPlayer:(Player *) thePlayer;
-(float)convertEnergyToScaleFactor;
-(void)drainEnergy;
-(void)update;
-(CGRect)getTouchBox;
-(BOOL) isNotWarpingIntoShootButton:(CGPoint) touchPoint;

@end
