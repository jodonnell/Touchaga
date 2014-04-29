//
//  SQLite3DataAccess.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

/**
 * Loads all the game information from a sqlite database.
 * If you need to change the backend, the methods were intentionally
 * left generic and could be made into an interface.
 * NOTE: Probably should have a caching proxy in front of this
 * NOTE: currently always recreates db
 */
@interface SQLite3DataAccess : NSObject {
    NSString *databaseName;
    NSString *databasePath;
    sqlite3 *database;
}

/** The database name. */
@property (retain, nonatomic) NSString *databaseName;

/** The database path to the user space in which it resides. */
@property (retain, nonatomic) NSString *databasePath;

/** The database. */
@property (assign, nonatomic) sqlite3 *database;


/**
 * Constructor
 * @return The shared instance of the singleton.
 */
+(SQLite3DataAccess *) sharedInstance;

/**
 * Gets all the level create events for a level given an id.
 * @return An array containing all the levels level create events (LevelCreateEvent).
 */
-(NSMutableArray *) getLevel:(int) level;

/**
 * Returns path id and actions id for a pattern.
 * @return An array in the slot is the path id, in the second the actions id.
 */
-(NSMutableArray *) getPattern:(int) patternId;

/**
 * Gets a path given a path id.
 * @return A path which is a dictionary indexed on time, that holds a CGPoint.
 */
-(NSMutableDictionary *) getPath:(int) pathId;

/**
 * Gets all the action points given an actions id
 * @return A dictionary which is indexed on time, holds an ActionPoint .
 */
-(NSMutableDictionary *) getActionPoints:(int) actionId;

@end
