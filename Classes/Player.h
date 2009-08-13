//
//  Player.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"
#import "Energy.h"

@interface Player : AtlasSprite {
    Energy *energy;
    int lives;
}

@property (retain, nonatomic) Energy *energy;
@property (nonatomic) int lives;

@end
