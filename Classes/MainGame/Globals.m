//
//  Globals.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/2/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Globals.h"

@implementation Globals

@synthesize playerManager;
@synthesize bulletManager;
@synthesize warpOutManager;
@synthesize backgroundMangaer;
@synthesize enemyManager;
@synthesize shootButtonRect;

+(Globals *) sharedInstance
{
    static Globals *myInstance = nil;
 
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
    }

    return myInstance;
}

-(id) init
{
    if(self=[super init]) {
        playerManager = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:50];
        bulletManager = [AtlasSpriteManager spriteManagerWithFile:@"bullet.png" capacity:50];
        warpOutManager = [AtlasSpriteManager spriteManagerWithFile:@"warpCircle.png" capacity:50];
        backgroundMangaer = [AtlasSpriteManager spriteManagerWithFile:@"background.png" capacity:50];
        enemyManager = [AtlasSpriteManager spriteManagerWithFile:@"enemies.png" capacity:50];
        shootButtonRect = CGRectMake(0,0,80,80);
    }
    return self;
}

-(void) dealloc
{
    [playerManager release];
    [bulletManager release];
    [warpOutManager release];
    [backgroundMangaer release];
    [enemyManager release];

    [super dealloc];
}

@end
