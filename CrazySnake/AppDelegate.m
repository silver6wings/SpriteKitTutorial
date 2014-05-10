//
//  AppDelegate.m
//  CrazySnake
//
//  Created by silver6wings on 14-4-11.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "PlaneViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES]; // 旧版ios隐藏状态栏
    
    UIViewController * rvc = [[RootViewController alloc] init];
    //UIViewController * rvc = [[PlaneViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rvc;
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application{}
- (void)applicationDidEnterBackground:(UIApplication *)application{}
- (void)applicationWillEnterForeground:(UIApplication *)application{}
- (void)applicationDidBecomeActive:(UIApplication *)application{}
- (void)applicationWillTerminate:(UIApplication *)application{}

@end
