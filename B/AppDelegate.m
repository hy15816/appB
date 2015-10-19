//
//  AppDelegate.m
//  B
//
//  Created by AEF-RD-1 on 15/10/19.
//  Copyright (c) 2015年 hyIm. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#warning 第一种情况  在A调用此App B时，B没有运行 会先调用application:openURL:sourceApplication:annotation这个方法，在启动application:didFinishLaunchingWithOptions:这个方法
    //NSLog(@"App B AppDelegate.m - application:didFinishLaunchingWithOptions:");
    //UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"title" message:@"App B AppDelegate.m - application:didFinishLaunchingWithOptions:" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"sure", nil];
    //[a show];
    return YES;
}

#warning 第二种情况  在A调用此App B时，B在挂起状态 直接在这个方法，而不会在调用application:didFinishLaunchingWithOptions:
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    //做一下判断，(好像没什么实际意义？，觉得应该判断sourceApplication--源app)
    if ([[url scheme] isEqualToString:@"thisIsAppB"]) {
        
        NSLog(@"是从%@跳转过来的，url.resourceSpecifier:%@",sourceApplication,[url resourceSpecifier]);
        NSArray *array =  [[url resourceSpecifier] componentsSeparatedByString:@"//"] ;
        NSLog(@"参数Array:%@",array);
        NSArray *array2 = [[array objectAtIndex:1] componentsSeparatedByString:@"&"];
        NSLog(@"array2:%@",array2);
        NSArray *array3 = [[array2 objectAtIndex:1] componentsSeparatedByString:@"="];
        NSLog(@"array3:%@",array3);
        NSLog(@"name = %@",[array3 objectAtIndex:1]);
        NSLog(@"url.absoluteString:%@",[url absoluteString]);
        NSLog(@"scheme:%@",[url scheme]);
        NSLog(@"query :%@",[url query]);
        NSDictionary *dict = @{@"appName":[array3 objectAtIndex:1]};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"acceptName" object:nil userInfo:dict];

    }
    
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"title" message:[NSString stringWithFormat:@"App B application:openURL:sourceApplication:annotation --> url:%@,sourceApp:%@",url,sourceApplication] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"sure", nil];
    [a show];
    return YES;
    
    
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    if ([[url scheme] isEqualToString:@"myAppA"])
    {
        NSLog(@"%@",url);
    }
    return YES;
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
}

@end
