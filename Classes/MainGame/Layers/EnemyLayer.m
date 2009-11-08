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
#import "PlayerLayer.h"
#import "defines.h"

#include <stdlib.h>

#define kTagSpriteManager 1
#define kTagEnemyTest 2

@implementation EnemyLayer

@synthesize enemies;

-(id) init
{
    if( (self=[super init] )) {
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"enemies.png" capacity:1];
	[self addChild:mgr z:0 tag:kTagSpriteManager];
	enemies = [[NSMutableArray alloc] init];

	for (int i = 0; i < 12; i++) {
	    PawnSprite *sprite = [PawnSprite spriteWithRect:CGRectMake(0,0,26,26) spriteManager:mgr];
	    sprite.position = ccp(arc4random() % 300, arc4random() % 400);
	    [mgr addChild:sprite z:0];
	    [enemies addObject: sprite];
	}
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

-(CocosNode *) getPlayerLayer
{
    return (PlayerLayer *)[[self parent] getChildByTag:kTagPlayerLayer];
}


-(void) draw
{
    int screen_width = [[Director sharedDirector] winSize].width;
    int screen_height = [[Director sharedDirector] winSize].height;


    PlayerLayer *playerLayer = [self getPlayerLayer];

    for (int i = 0; i < [enemies count]; i++) {
	PawnSprite *sprite = [enemies objectAtIndex:i];

	if ((sprite.position.x > screen_width) || (sprite.position.x < 0))
	    sprite.xSpeed = sprite.xSpeed * -1;

	if ((sprite.position.y > screen_height) || (sprite.position.y < 0))
	    sprite.ySpeed = sprite.ySpeed * -1;


	sprite.position = ccp(sprite.position.x + sprite.xSpeed, sprite.position.y + sprite.ySpeed);

	if (CGRectIntersectsRect([sprite getSpriteRect], [[playerLayer getPlayer] getSpriteRect])){
	    AtlasSpriteManager *mgr = (AtlasSpriteManager *)[self getChildByTag: kTagSpriteManager];
	    [enemies removeObject: sprite];
	    [mgr removeChild: sprite cleanup:YES];
	}
    }

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
