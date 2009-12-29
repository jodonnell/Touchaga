//
//  PlayerBullet.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerBullet.h"
#import "SpriteManager.h"

@implementation PlayerBullet

+(id)init
{
    return [[[self alloc] init] autorelease];
}

-(id)init
{
    spriteManager = [[PlayerBulletSpriteManager alloc] init];
    self = [super initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
    return self;
}

-(void) moveTo: (CGPoint) point
{
    self.position = point;
}

-(void) dealloc
{
    [super dealloc];
}

@end
