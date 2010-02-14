//
//  SceneManager.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "LevelEvent.h"

@implementation Level

@synthesize levelEvents;

//SEL setWidthHeight;
//setWidthHeight = NSSelectorFromString(aBuffer);
// http://theocacao.com/document.page/264
// http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/ObjectiveC/Articles/ocSelectors.html

// constrain all public methods to simple argument types (ints?) expand to more if need be
// pretty serious constraint, is it fair?
// events - create, move, different shoots, i think this constraint will be fine

-(id) initWithLevel:(NSString *)level;
{
    if( (self=[super init] )) {
        levelEvents = [[NSMutableArray alloc] init];

        NSStringEncoding encoding;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:level ofType:@"txt"];  
        NSString *fileString = [NSString stringWithContentsOfFile:filePath usedEncoding:&encoding error:NULL];

        NSArray *lines = [fileString componentsSeparatedByString:@"\n"];
        for(NSString *line in lines)
        {
            NSArray *lineElements = [line componentsSeparatedByString:@","];

            int i = 0;
            LevelEvent *levelEvent = [[LevelEvent alloc] init];
            for(NSString *element in lineElements) {
                if (i == 0)
                    [levelEvent setTime:[element intValue]];
                else if (i == 1)
                    [levelEvent setPatternId:[element intValue]];
                else if (i == 3)
                    [levelEvent setObjectType:element];
                i++;
            }

            [levelEvents addObject:levelEvent];
        }
    }
    return self;
}

-(NSMutableArray *) getEventsWithTime:(int) time
{
    NSMutableArray *events = [[NSMutableArray alloc] init];

    LevelEvent *levelEvent;
    for (levelEvent in levelEvents) 
    {
        if ([levelEvent time] == time)
            [events addObject:levelEvent];
    }

    return events;
}


@end
