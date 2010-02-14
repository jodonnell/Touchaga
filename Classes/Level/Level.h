//
//  Level.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 */
@interface Level : NSObject {
    NSMutableArray *levelEvents;
}

@property (retain, nonatomic) NSMutableArray *levelEvents;

/**
 */
-(id) initWithLevel:(NSString *) level;

/**
 * Returns all events that have the given time.
 * NOTE: might want to optimize this lookup, perhaps change it to a hash
 */
-(NSMutableArray *) getEventsWithTime:(int) time;

@end
