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

+ (Globals *)sharedInstance
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
	bulletManager = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:50];
    }
    return self;
}

@end
