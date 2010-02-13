//
//  Path.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Must be able to load a path and save a path.
 * Maybe should be an iterator.
 */
@interface Path : NSObject {
    NSMutableArray *path;
}

/** A list of CGPoints that make up the path. */
@property (retain, nonatomic) NSMutableArray *path;

/**
 * Adds a point to the path.
 */
-(void) addPoint:(CGPoint) point;

/**
 * If the path is valid returns YES, checks if start and finish of path touch screen edges.
 */
-(BOOL) isValid;

@end
