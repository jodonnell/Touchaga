//
//  Player.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"
#import "Energy.h"

@interface PlayerSprite : AtlasSprite <TargetedTouchDelegate> {
    Energy *energy;
    int lives;
    BOOL moving;
}

@property (retain, nonatomic) Energy *energy;
@property (nonatomic) int lives;
@property (nonatomic) BOOL moving;

-(CGRect)getTouchBox;
-(int) fire;
-(BOOL) hasEnoughEnergy: (int) charge;
-(void) depleteEnergy: (int) charge;
-(void) chargingEnergy: (int) charge;
-(void) regainEnergy: (int) energyToRegain;

@end
