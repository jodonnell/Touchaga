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

-(id)init
{
    spriteManager = [[PlayerBulletSpriteManager alloc] init];
    return [super initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
}

-(void) moveTo: (CGPoint) point
{
    self.position = point;
}

-(void) dealloc
{
    [spriteManager release];
    [super dealloc];    
}

@end
