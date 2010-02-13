//
//  Pattern.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Path

/**
 * will also contain action points that contain keys to where they happen in the path
 */
@interface Pattern : NSObject {
    Path *path;
}

/** The path. */
@property (retain, nonatomic) Path *path;

@end
