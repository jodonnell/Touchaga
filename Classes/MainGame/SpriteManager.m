//
//  SpriteManager.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SpriteManager.h"
#import "Globals.h"

enum {
    kTagPlayer = 1,
    kTagPlayerBullet = 2,

    kTagBackground = 3,
    kTagWarpOutSprite = 4,
};



@implementation SpriteManager

@synthesize manager;
@synthesize imageRect;
@synthesize tag;
@synthesize zIndex;

-(id) init
{
    if( (self=[super init] )) {
    }
    return self;
}

-(void) dealloc
{
    [manager release];
    [super dealloc];
}

@end


@implementation PlayerSpriteManager

-(id) init
{
    if( (self=[super init] )) {
	manager = [[Globals sharedInstance] playerManager];
	imageRect = CGRectMake(0,0,16,16);
	tag = kTagPlayer;
	zIndex = 1;
    }
    return self;
}

@end

@implementation PlayerBulletSpriteManager

-(id) init
{
    if(self=[super init]) {
	manager = [[Globals sharedInstance] bulletManager];
	imageRect = CGRectMake(0,0,8,8);
	tag = kTagPlayerBullet;
	zIndex = 1;
    }
    return self;
}

@end

@implementation WarpOutSpriteManager

-(id) init
{
    if(self=[super init]) {
	manager = [[Globals sharedInstance] warpOutManager];
	imageRect = CGRectMake(0,0,100,100);
	tag = kTagBackground;
	zIndex = 1;
    }
    return self;
}

@end

@implementation BackgroundSpriteManager

-(id) init
{
    if(self=[super init]) {
	manager = [[Globals sharedInstance] backgroundMangaer];
	imageRect = CGRectMake(0,0,480,320);
	tag = kTagBackground;
	zIndex = 0;
    }
    return self;
}

@end
