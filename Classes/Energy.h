//
//  Energy.h
//  Touchaga
//
//  Created by Jacob O'Donnell on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Energy : NSObject {
	int unchargedEnergy;
	int chargedEnergy;
	int maxEnergy;
}

@property (nonatomic) int unchargedEnergy;
@property (nonatomic) int chargedEnergy;
@property (nonatomic) int maxEnergy;

-(int) getTotalEnergy;

@end
