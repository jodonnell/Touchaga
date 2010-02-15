//
//  SQLite3DataAccess.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 2/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

/**
 * NOTE: Probably should have a caching proxy in front of this
 * NOTE: currently always recreates db
 */
@interface SQLite3DataAccess : NSObject {
    NSString *databaseName;
    NSString *databasePath;
    sqlite3 *database;
}

@property (retain, nonatomic) NSString *databaseName;
@property (retain, nonatomic) NSString *databasePath;
@property (assign, nonatomic) sqlite3 *database;


/**
 * Constructor
 * @return The shared instance of the singleton.
 */
+(SQLite3DataAccess *) sharedInstance;

-(void) checkAndCreateDatabase;
-(NSMutableArray *) getLevel:(int) level;
-(NSArray *) getPattern:(int) patternId;
-(NSMutableDictionary *) getPath:(int) pathId;
-(NSMutableDictionary *) getActionPoints:(int) actionId;

@end
