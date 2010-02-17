//
//  Pattern.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Path;
@class ActionPoint;

/**
 * The Pattern object represents an enemy or object who follows some scripted action and
 * then disappears off screen.  In this game all enemies and hazards are scripted, although
 * bullets are not.
 * A pattern contains one path and some amount of actions.
 */
@interface Pattern : NSObject {
    Path *path;
    NSMutableDictionary *actions;
}

/** The path. */
@property (retain, nonatomic) Path *path;

/** All the actions. */
@property (retain, nonatomic) NSMutableDictionary *actions;


/**
 * Creates a pattern based on an ID.
 * @param patternId The pattern ID for the pattern to load.
 * @return Newly constructed object.
 */
-(id)initWithId:(int) patternId;

/**
 * Returns the point on a path at a given time.
 * @param relativeTime The amount of time the action is through.
 * @return A CGPoint that the object should be at currently.
 */
-(CGPoint) getPosAtTime:(int) relativeTime;

/**
 * @param relativeTime The amount of time the action is through.
 * @return Returns an ActionPoint.
 */
-(ActionPoint *) getActionPointAtTime:(int) relativeTime;

/**
 * @param time The time you are checking to see if the pattern is over at.
 * @return YES if the pattern is over.
 */
-(BOOL) isPatternOverAtTime:(int) relativeTime;

@end
