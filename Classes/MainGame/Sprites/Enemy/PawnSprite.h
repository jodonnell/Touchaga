//
//  PawnSprite.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EnemySprite.h"


@interface PawnSprite : EnemySprite {
    int xSpeed;
    int ySpeed;
}

@property (nonatomic) int xSpeed;
@property (nonatomic) int ySpeed;



@end
