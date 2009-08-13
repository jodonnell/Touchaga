//
//  UIShootLayer.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "PlayerSprite.h"

@interface UIShootLayer : Layer {
	CGRect shootRect;
}

@property (nonatomic) CGRect shootRect;

-(CocosNode *)getGamePlayScene;
-(void) regainEnergy: (ccTime) dt;
-(PlayerSprite *) getPlayer;
-(void) chargeShot: (ccTime) dt;

//start charging
- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@end
