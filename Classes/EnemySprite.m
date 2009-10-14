//
//  EnemySprite.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EnemySprite.h"

@implementation EnemySprite

@synthesize hp;

-(id)initWithRect:(CGRect)rect spriteManager:(AtlasSpriteManager*)manager
{
    [self schedule: @selector(move:) interval:0];
    return [super initWithRect:rect spriteManager:manager];
}

-(void) dealloc
{
    [super dealloc];
}

-(void) doDamage:(int) damage
{
    hp -= damage;
}

-(BOOL) isDead
{
    if (hp < 0)
	return YES;
    return NO;
}

-(void) move: (ccTime) dt
{
    self.position = CGPointMake(self.position.x + 1, self.position.y);
}

@end
