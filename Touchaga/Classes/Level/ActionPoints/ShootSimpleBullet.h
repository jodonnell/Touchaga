//
//  ShootSimpleBullet.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/**
 * An action is a non movement action at a given time for a given pattern.
 * A pattern can have many actions throughout it's life.
 * An ActionPoint uses the Command design pattern.
 * Constraint: Only one action at any given time.
 */
@interface ShootSimpleBullet : ActionPoint {

}

/**
 * Shoots a bullet with an initial vector.
 */
-(void) execute;

@end
