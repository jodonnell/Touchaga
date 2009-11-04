//
//  PathCreatorLayer.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 9/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TouchDelegateProtocol.h"
#import "Layer.h"

/**
 * @TODO need to batch
 */
@interface PathCreatorLayer : Layer <TargetedTouchDelegate> {
@private
    BOOL touched;
    NSMutableArray *linePoints;
}

/** When the screen has been touched this is set to YES, to prevent multiple touches */
@property (nonatomic) BOOL touched;

/** Keeps track of all the points touched on the screen */
@property (nonatomic, retain) NSMutableArray *linePoints;


/**
 * Draws lines between all the marked points the editor has made
 */
-(void) drawAllLines;

@end
