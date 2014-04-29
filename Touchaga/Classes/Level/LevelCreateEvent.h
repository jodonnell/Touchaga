//
//  LevelCreateEvent.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A create object event, holds the time an object is to be created,
 * the pattern to follow, and the class of the object to instantiate.
 */
@interface LevelCreateEvent : NSObject {
    int time;
    int patternId;
    NSString *objectType;
}

/** The object type to instantiate. */
@property (retain, nonatomic) NSString *objectType;

/** The time to instantiate the object. */
@property (nonatomic) int time;

/** The pattern id that the object will follow. */
@property (nonatomic) int patternId;

@end
