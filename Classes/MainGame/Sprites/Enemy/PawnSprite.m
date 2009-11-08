//
//  PawnSprite.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PawnSprite.h"
#include <stdlib.h>

@implementation PawnSprite

@synthesize xSpeed;
@synthesize ySpeed;

-(id)initWithRect:(CGRect)rect spriteManager:(AtlasSpriteManager*)manager
{
    hp = 100;
    xSpeed = arc4random() % 4 + 1;
    ySpeed = arc4random() % 4 + 1;
    return [super initWithRect:rect spriteManager:manager];
}


@end
