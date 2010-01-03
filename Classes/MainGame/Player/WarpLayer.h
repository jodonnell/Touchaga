//
//  WarpLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/3/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.


#import "cocos2d.h"


@interface WarpLayer : Layer {
@private 
    BOOL warpIn;
    CGPoint center;
    int energy;
}

@property (nonatomic) BOOL warpIn;
@property (nonatomic) CGPoint center;
@property (nonatomic) int energy;

-(id) initWithCenterPoint: (CGPoint) point andEnergy:(int) energy;
-(int)convertEnergyToRadius;

@end
