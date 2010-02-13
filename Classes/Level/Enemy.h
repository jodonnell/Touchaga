//
//  Enemy.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pattern

/**
 * will also contain action points that contain keys to where they happen in the path
 */
@interface Enemy : NSObject {
    Pattern *pattern;
}

/** The Pattern the enemy follows. */
@property (retain, nonatomic) Pattern *pattern;

@end
