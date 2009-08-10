//
//  UIShootLayer.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface UIShootLayer : Layer {
	CGRect shootRect;
}

@property (nonatomic) CGRect shootRect;

- (CocosNode *)getGamePlayScene;

//start charging
- (BOOL)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@end
