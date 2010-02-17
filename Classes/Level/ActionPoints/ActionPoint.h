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
 * An ActionPoint uses the Command design pattern.
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
 * Abstract method for the Command Pattern, does whatever action is appropriate for the action.
 */
-(void) execute;

/**
 * @return YES if this action is a primary shot.
 */
-(BOOL) isActionPointPrimaryShoot;

@end
