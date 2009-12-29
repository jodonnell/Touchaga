//
//  SpriteManager.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SpriteManager.h"

enum {
    kTagPlayer = 1,
    kTagPlayerBullet = 2,
};

@implementation SpriteManager

@synthesize manager;
@synthesize imageRect;
@synthesize tag;
@synthesize zIndex;

-(void) dealloc
{
    [super dealloc];
}

-(AtlasSpriteManager *) getManager
{
    return self.manager;
}

@end



@implementation PlayerSpriteManager

-(id) init
{
    if( (self=[super init] )) {
	manager = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:1];
	imageRect = CGRectMake(0,0,16,16);
	tag = kTagPlayer;
	zIndex = 100;
    }
    return self;
}

@end

@implementation PlayerBulletSpriteManager

-(id) init
{
    if(self=[super init]) {
	manager = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:2];
	imageRect = CGRectMake(0,0,8,8);
	tag = kTagPlayerBullet;
	zIndex = 0;
    }
    return self;
}

@end
