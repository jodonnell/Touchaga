//
//  GameLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 12/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@class Player;

@interface GameLayer : Layer {

}

-(Player *) createPlayer;

@end

