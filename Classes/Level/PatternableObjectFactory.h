//
//  PatternableObjectFactory.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Path

/**

 */
@interface PatternableObjectFactory : NSObject {

}

/**
 * Creates and returns 
 * @param patternId The pattern ID for the pattern to load.
 * @return Newly constructed object.
 */
+(id)initWithType:(NSString *) objectType andPattern:(Pattern *) pattern andStartTime:(int) startTime;

@end
