//
//  WarpLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.


#import "cocos2d.h"

@class Player;

@interface WarpLayer : Layer {
@private 
    BOOL warpIn;
    CGPoint center;
    int energy;
    Player *player;
}

@property (nonatomic) BOOL warpIn;
@property (nonatomic) CGPoint center;
@property (nonatomic) int energy;
@property (retain, nonatomic) Player *player;

-(id) initWithPlayer:(Player *) thePlayer;
-(int)convertEnergyToRadius;
-(void)drainEnergy;

@end
