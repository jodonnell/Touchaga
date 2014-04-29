//
//  PlayerBullet.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerBullet.h"
#import "SpriteManager.h"

enum {
    kPlayerBulletMovementSpeed = 13,
};

@implementation PlayerBullet

-(id)init
{
    spriteManager = [[PlayerBulletSpriteManager alloc] init];
    return [super initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];
}

-(void) dealloc
{
    [super dealloc];    
}

-(void) update
{
    self.position = CGPointMake(self.position.x, self.position.y + kPlayerBulletMovementSpeed);
}

@end
