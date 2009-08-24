//
//  EnemyLayer.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EnemyLayer.h"
#import "EnemySprite.h"
#import "PlayerBulletSprite.h"

#define kTagSpriteManager 1
#define kTagEnemyTest 2

@implementation EnemyLayer

@synthesize enemies;

-(id) init
{
    if( (self=[super init] )) {
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"enemies.png" capacity:1];
	[self addChild:mgr z:0 tag:kTagSpriteManager];
	PawnSprite *sprite = [PawnSprite spriteWithRect:CGRectMake(0,0,26,26) spriteManager:mgr];
	sprite.position = ccp(200, 350);
	[mgr addChild:sprite z:0 tag:kTagEnemyTest];

	enemies = [[NSMutableArray alloc] init];
	[enemies addObject: sprite];
    }
    return self;
}

-(void) dealloc
{
    [enemies release];
    [super dealloc];
}

-(void) addEnemy:(EnemySprite *) enemySprite
{
//    AtlasSpriteManager *mgr= (AtlasSpriteManager *)[self getChildByTag:kTagSpriteManager];
//    [mgr addChild:sprite z:0 tag:kTagEnemyTest];
//     PlayerSprite *sprite = [PlayerSprite spriteWithRect:CGRectMake(0,0,16,16) spriteManager:mgr];
//     sprite.position = ccp(100, 150);
//     

}

-(BOOL) checkForBulletEnemyCollision:(PlayerBulletSprite *)bulletSprite
{
    for (int i = 0; i < [enemies count]; i++)
    {
 	if (CGRectIntersectsRect([bulletSprite getSpriteRect], [[enemies objectAtIndex:i] getSpriteRect]))
 	{
	    [[enemies objectAtIndex:i] doDamage:bulletSprite.charge];
	    if ([[enemies objectAtIndex:i] isDead])
		[self removeEnemy: [enemies objectAtIndex:i]];

	    return YES;
 	}
    }
    return NO;
}

-(void) removeEnemy: (EnemySprite *) enemySprite
{
    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
    [enemies removeObject: enemySprite];
    [mgr removeChild: enemySprite cleanup:YES];
}


@end
