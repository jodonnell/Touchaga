#import "Globals.h"

@implementation Globals

@synthesize playerManager;
@synthesize bulletManager;

+ (Globals *)sharedInstance
{
    // the instance of this class is stored here
    static Globals *myInstance = nil;
 
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

-(id) init
{
    if(self=[super init]) {
	playerManager = [AtlasSpriteManager spriteManagerWithFile:@"player.png" capacity:50];
	bulletManager = [AtlasSpriteManager spriteManagerWithFile:@"bullets.png" capacity:50];
    }
    return self;
}

@end
