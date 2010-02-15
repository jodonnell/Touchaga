//
//  ActionPoint.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * An action is a non movement action at a given time for a given pattern.
 * A pattern can have many actions throughout it's life.
 * Constraint: Only one action at any given time.
 */
@interface ActionPoint : NSObject {
    NSString *action;
}

/** The string that contains what the action is. */
@property (retain, nonatomic) NSString *action;

/**
 * Loads an action given an action point id.
 */
-(id)initWithAction:(NSString *) inActionPoint;

/**
 * @return YES if this action is a primary shot.
 */
-(BOOL) isActionPointPrimaryShoot;

@end
