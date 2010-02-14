//
//  SQLite3DataAccess.m
//  MyFirstGame
//
//  Created by Jacob O'Donnell on 8/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SQLite3DataAccess.h"
#import "LevelCreateEvent.h"
#import "ActionPoint.h"
#import "cocos2d.h"

@implementation SQLite3DataAccess

@synthesize databaseName;
@synthesize databasePath;
@synthesize database;

+(SQLite3DataAccess *) sharedInstance
{
    static SQLite3DataAccess *myInstance = nil;
 
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
    }

    return myInstance;
}

-(id) init
{
    if( (self=[super init] )) {
        databaseName = @"touchaga.db";

        // Get the path to the documents directory and append the databaseName
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:databaseName];

        [self checkAndCreateDatabase];

        if(sqlite3_open([databasePath UTF8String], &database) != SQLITE_OK)
            [NSException raise:@"Could not connect to db" format:@"Invalid."]; // TODO this is no good

    }
    return self;
}

-(void) dealloc
{
    [databaseName release];
    [databasePath release];

    sqlite3_close(database);

    [super dealloc];    
}



-(void) checkAndCreateDatabase
{
    // Check if the SQL database has already been saved to the users phone, if not then copy it over
    BOOL success;

    // Create a FileManager object, we will use this to check the status
    // of the database and to copy it over if required
    NSFileManager *fileManager = [NSFileManager defaultManager];

    // Check if the database has already been created in the users filesystem
    success = [fileManager fileExistsAtPath:databasePath];

    // If the database already exists then return without doing anything
//    if(success) return;

    // If not then proceed to copy the database from the application to the users filesystem

    // Get the path to the database in the application package
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];

    // Copy the database from the package to the users filesystem
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];

    [fileManager release];
}

-(NSMutableArray *) getLevel:(int) level
{
    NSMutableArray *levelEvents = [[NSMutableArray alloc] init];

    const char *sqlStatement = "select time, pattern, object_types.object_type from levels, object_types where level = ? and levels.object_type == object_types.id";
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        if (sqlite3_bind_int(compiledStatement, 1, level) != SQLITE_OK)
            [NSException raise:@"Could not bind" format:@"Invalid."]; // TODO this is no good

        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            int time = sqlite3_column_int(compiledStatement, 0);
            int pattern = sqlite3_column_int(compiledStatement, 1);
            NSString *objectType = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];

            LevelCreateEvent *levelEvent = [[LevelCreateEvent alloc] init];
            [levelEvent setTime:time];
            [levelEvent setPatternId:pattern];
            [levelEvent setObjectType:objectType];

            [levelEvents addObject:levelEvent];
        }
    }
    sqlite3_finalize(compiledStatement);

    return levelEvents;
}

-(NSArray *) getPattern:(int) patternId
{
    NSArray *pathAndActionIds;
    const char *sqlStatement = "select path_id, actions_id from pattern where id = ?";
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        if (sqlite3_bind_int(compiledStatement, 1, patternId) != SQLITE_OK)
            [NSException raise:@"Could not bind" format:@"Invalid."]; // TODO this is no good

        if (sqlite3_step(compiledStatement) != SQLITE_ROW)
            [NSException raise:@"Could not find patternid" format:@"Invalid. %i", patternId]; // TODO this is no good

        NSNumber *pathId = [NSNumber numberWithInt:sqlite3_column_int(compiledStatement, 0)];
        NSNumber *actionsId = [NSNumber numberWithInt:sqlite3_column_int(compiledStatement, 1)];
        pathAndActionIds = [[NSArray alloc] initWithObjects:pathId, actionsId, nil];
    }
    sqlite3_finalize(compiledStatement);

    return pathAndActionIds;
}

-(NSMutableDictionary *) getPath:(int) pathId
{
    NSMutableDictionary *path = [[NSMutableDictionary alloc] init];
    const char *sqlStatement = "select time, x, y from paths, points where paths.id = ? and paths.point_id == points.id";
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        if (sqlite3_bind_int(compiledStatement, 1, pathId) != SQLITE_OK)
            [NSException raise:@"Could not bind pathId" format:@"Invalid."]; // TODO this is no good

        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            NSNumber *time = [NSNumber numberWithInt:sqlite3_column_int(compiledStatement, 0)];
            CGPoint point = ccp(sqlite3_column_int(compiledStatement, 1), sqlite3_column_int(compiledStatement, 2));
            [path setObject: [NSValue valueWithCGPoint:point] forKey: time];
        }
    }
    sqlite3_finalize(compiledStatement);

    return path;
}

-(NSMutableDictionary *) getActionPoints:(int) actionId
{
    NSMutableDictionary *actions = [[NSMutableDictionary alloc] init];
    const char *sqlStatement = "select time, action_name from actions, action where actions.id = ? and actions.action == action.id";
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        if (sqlite3_bind_int(compiledStatement, 1, actionId) != SQLITE_OK)
            [NSException raise:@"Could not bind actionId" format:@"Invalid. %i", actionId]; // TODO this is no good

        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            NSNumber *time = [NSNumber numberWithInt:sqlite3_column_int(compiledStatement, 0)];
            NSString *actionName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
            ActionPoint *ap = [[ActionPoint alloc] initWithAction:(NSString *)actionName];
            [actions setObject:ap forKey: time];
        }
    }
    sqlite3_finalize(compiledStatement);

    return actions;
}

@end
