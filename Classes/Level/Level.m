//
//  SceneManager.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "LevelEvent.h"
#import <sqlite3.h>

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
        [self checkAndCreateDatabase];
        [self readAnimalsFromDatabase];
//         levelEvents = [[NSMutableArray alloc] init];

//         NSStringEncoding encoding;
//         NSString *filePath = [[NSBundle mainBundle] pathForResource:level ofType:@"txt"];  
//         NSString *fileString = [NSString stringWithContentsOfFile:filePath usedEncoding:&encoding error:NULL];

//         NSArray *lines = [fileString componentsSeparatedByString:@"\n"];
//         for(NSString *line in lines)
//         {
//             NSArray *lineElements = [line componentsSeparatedByString:@","];

//             int i = 0;
//             LevelEvent *levelEvent = [[LevelEvent alloc] init];
//             for(NSString *element in lineElements) {
//                 if (i == 0)
//                     [levelEvent setTime:[element intValue]];
//                 else if (i == 1)
//                     [levelEvent setPatternId:[element intValue]];
//                 else if (i == 3)
//                     [levelEvent setObjectType:element];
//                 i++;
//             }

//             [levelEvents addObject:levelEvent];
//         }
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


-(void) checkAndCreateDatabase{
    NSString *databaseName = @"touchaga.db";

    // Get the path to the documents directory and append the databaseName
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    NSString *databasePath = [documentsDir stringByAppendingPathComponent:databaseName];


    // Check if the SQL database has already been saved to the users phone, if not then copy it over
    BOOL success;

    // Create a FileManager object, we will use this to check the status
    // of the database and to copy it over if required
    NSFileManager *fileManager = [NSFileManager defaultManager];

    // Check if the database has already been created in the users filesystem
    success = [fileManager fileExistsAtPath:databasePath];

    // If the database already exists then return without doing anything
    if(success) return;

    // If not then proceed to copy the database from the application to the users filesystem

    // Get the path to the database in the application package
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];

    // Copy the database from the package to the users filesystem
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];

    [fileManager release];
}

-(void) readAnimalsFromDatabase {
    NSString *databaseName = @"touchaga.db";

    // Get the path to the documents directory and append the databaseName
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    NSString *databasePath = [documentsDir stringByAppendingPathComponent:databaseName];

    // Setup the database object
    sqlite3 *database;


    // Open the database from the users filessytem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        // Setup the SQL Statement and compile it for faster access
        const char *sqlStatement = "select * from levels";
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                // Read the data from the result row
                NSString *level = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
//                NSString *aDescription = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
//                NSString *aImageUrl = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];

                NSLog(@"%@", level);

            }
        }
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);

    }
    sqlite3_close(database);

}


@end
