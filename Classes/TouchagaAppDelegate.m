//
// cocos2d template example
// http://www.cocos2d-iphone.org
//

#import "TouchagaAppDelegate.h"
#import "SceneManager.h"
#import "cocos2d.h"

@implementation TouchagaAppDelegate

// window is a property. @synthesize will create the accesors methods
@synthesize window;

// Application entry point
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    // create an initilize the main UIWindow
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [window setUserInteractionEnabled:YES];
    [window setMultipleTouchEnabled:YES];

    if( ! [Director setDirectorType:CCDirectorTypeDisplayLink] )
        [Director setDirectorType:CCDirectorTypeDefault];

    // Attach cocos2d to the window
    [[Director sharedDirector] attachInWindow:window];

    // before creating any layer, set the landscape mode
    [[Director sharedDirector] setDeviceOrientation:CCDeviceOrientationLandscapeLeft];

    [Director sharedDirector].displayFPS = YES;

    // Make the window visible
    [window makeKeyAndVisible];

    // Create and initialize parent and empty Scene
    SceneManager *sceneManager = [[SceneManager alloc] init];
    [sceneManager release];
}

- (void) dealloc
{
    [window release];
    [super dealloc];
}

@end
