//
//  AppDelegate.m
//  HelloArrow
//
//  Created by innerpeacer on 15/1/2.
//  Copyright (c) 2015年 innerpeacer. All rights reserved.
//

#import "AppDelegate.h"
#import "GLView.h"

@interface AppDelegate ()
{
    UIWindow *_winow;
    GLView *_glView;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    _window = [[UIWindow alloc] initWithFrame:screenBounds];
    
    _glView = [[GLView alloc] initWithFrame:screenBounds];
    [_window addSubview:_glView];
    [_window makeKeyAndVisible];
    return YES;
}



@end
