//
//  TouchagaSprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchagaSprite.h"

@implementation TouchagaSprite

@synthesize spriteManager;

-(id) init
{
    if( (self=[super init] )) {
    }
    return self;
}

-(void) dealloc
{
    [spriteManager release];
    [super dealloc];
}

@end

