//
//  AppDelegate.m
//  01.LOL
//
//  Created by sks on 16/7/5.
//  Copyright © 2016年 Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "MagicalRecord.h"
#import "PageViewController.h"
#import "StringConstants.h"
@interface AppDelegate ()<PageViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"leo.sqlite"];

    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    BOOL isFirst = [[NSUserDefaults standardUserDefaults]boolForKey:@"isFirst"];
                    
    if (isFirst) {
        RootViewController *vc = [[RootViewController alloc]init];
        _window.rootViewController = vc;
  
        
    }else{
    
        PageViewController *pvc = [[PageViewController alloc]init];
        pvc.delegate = self;

        _window.rootViewController = pvc;
    
    
    }
    
    
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)receiveTheViewController:(UIViewController *)controller
{

    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirst"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
   
    [UIView animateWithDuration:2 animations:^{
        controller.view.frame = CGRectMake(-WIDTH, 0, WIDTH, HEIGHT);
        RootViewController *rvc = [[RootViewController alloc]init];
        _window.rootViewController = rvc;
    } completion:^(BOOL finished) {
        [controller removeFromParentViewController];

    }];
    
    

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [MagicalRecord cleanUp];

}

@end
