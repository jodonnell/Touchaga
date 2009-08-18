//
//  PlayerBulletSprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"

@interface PlayerBulletSprite :  AtlasSprite {
    int charge;
}

@property (nonatomic) int charge;

+(id)initWithCharge:(int)initCharge spriteManager:(AtlasSpriteManager*)manager;
-(id)initWithCharge:(int)initCharge spriteManager:(AtlasSpriteManager*)manager;

@end
