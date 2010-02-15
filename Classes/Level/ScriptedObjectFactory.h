//
//  ScriptedObjectFactory.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pattern;

/**
 * A parametrized factory that creates scripted objects given a string.
 */
@interface ScriptedObjectFactory : NSObject {

}

/**
 * Creates and returns a scripted object.
 * @param objectType The string that will determine the object that is returned.
 * @param pattern The pattern for the pattern to load.
 * @param startTime The time that this object was created at.
 * @return Newly constructed object.
 */
+(id)initWithType:(NSString *) objectType andPattern:(Pattern *) pattern andStartTime:(int) startTime;

@end
