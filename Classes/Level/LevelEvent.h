//
//  LevelEvent.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 */
@interface LevelEvent : NSObject {
    int time;
    int objId;
    NSString *method;
    NSMutableArray *arguments;
}

@property (retain, nonatomic) NSMutableArray *arguments;
@property (retain, nonatomic) NSString *method;
@property (nonatomic) int time;
@property (nonatomic) int objId;

/**
 */
-(void) setArgument:(int) argument;

@end
