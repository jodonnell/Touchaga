//
//  PlayerBulletSprite.m
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/18/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PlayerBulletSprite.h"


@implementation PlayerBulletSprite

@synthesize charge;

+(id)initWithCharge:(int)initCharge spriteManager:(AtlasSpriteManager*)manager
{
    return [[[self alloc] initWithCharge:initCharge spriteManager:manager] autorelease];
}

-(id)initWithCharge:(int)initCharge spriteManager:(AtlasSpriteManager*)manager
{
    CGRect rect;

    if (initCharge < 10)
	rect = CGRectMake(0,0,8,8);
    else if (initCharge >= 10 && initCharge < 20 )
	rect = CGRectMake(0,8,8,8);
    else if (initCharge >= 20 && initCharge < 50 )
	rect = CGRectMake(0,16,8,8);
    else if (initCharge >= 50 )
	rect = CGRectMake(0,24,8,8);
    
    self = [super initWithRect:rect spriteManager:manager];
    self.charge = initCharge;
    
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

@end
