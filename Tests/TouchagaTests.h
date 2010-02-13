//
//  TouchagaTests.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 1/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
//#import "application_headers" as required

@class Player;

/**
 * Unfortunately we cannot test anything to do with Touches since Apple gives no way
 * to create one pragmatically.
 */
@interface TouchagaTests : SenTestCase {
    Player *player;
}

@property (retain, nonatomic) Player *player;

@end
