//
//  PawnSprite.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PawnSprite.h"


@implementation PawnSprite

-(id)initWithRect:(CGRect)rect spriteManager:(AtlasSpriteManager*)manager
{
    hp = 100;
    return [super initWithRect:rect spriteManager:manager];
}


@end
