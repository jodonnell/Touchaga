//
//  BasicEnemy.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BasicEnemy.h"

#import "SpriteManager.h"
#import "GameLayer.h"

@implementation BasicEnemy

-(id)initWithStartTime:(int) inStartTime andPattern:(Pattern *) inPattern
{
    spriteManager = [[EnemySpriteManager alloc] init];
    self = [self initWithStartTime:inStartTime andPattern: inPattern andRect:spriteManager.imageRect andManager:spriteManager.manager];
    GameLayer *gameLayer = [GameLayer sharedInstance];
    [gameLayer addSpriteToLayer:self];
    [self setHp:3];
    return self;
}

// to send a tracking shot this needs player coords info.
-(void) primaryShoot
{

}

@end
