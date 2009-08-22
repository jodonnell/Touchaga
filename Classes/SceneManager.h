//
//  SceneManager.h
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Manages the active screen.  The game screen once loaded once will remain on the stack for the life of
 * the game.
 */
@interface SceneManager : NSObject {

}

-(void) makeGameCurrentScene: (int) level;
@end
