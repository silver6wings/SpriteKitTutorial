//
//  AppDelegate.m
//  PlaneDemo
//
//  Created by silver6wings on 14-8-23.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "AppDelegate.h"
#import "PlaneViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController * rvc = [[PlaneViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rvc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
