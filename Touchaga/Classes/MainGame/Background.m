//
//  Background.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Background.h"
#import "SpriteManager.h"

@implementation Background

-(id)init
{
    spriteManager = [[BackgroundSpriteManager alloc] init];
    self = [self initWithRect:spriteManager.imageRect spriteManager:spriteManager.manager];

    CGSize size = [[Director sharedDirector] winSize];
    self.position = ccp(size.width / 2, size.height / 2);
    return self;
}

@end
