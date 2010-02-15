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

-(void) moveTo: (CGPoint) point
{
    self.position = point;
}

-(CGRect) makeRect
{
    float w = [self contentSize].width;
    float h = [self contentSize].height;

    CGPoint point = CGPointMake([self position].x - (w/2), [self position].y - (h/2));
    return CGRectMake(point.x, point.y, w, h);
}

@end

