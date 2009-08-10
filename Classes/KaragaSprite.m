//
//  KaragaSprite.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "KaragaSprite.h"

@implementation AtlasSprite (KaragaSprite)

-(CGRect)getSpriteRect
{
    return CGRectMake(self.position.x, self.position.y, self.contentSize.width, self.contentSize.height);
}
@end
