//
//  AppDelegate.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "AppDelegate.h"
#import "PageOneTableVC.h"
#import "PageTwoVC.h"
#import "PageThreeTableVC.h"
#import "PageFourTableVC.h"
#import "PageFiveVC.h"
#import "TravelNotesTableVC.h"

@interface AppDelegate ()
@property (nonatomic,strong) UITabBarController *tab;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window .backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    UINavigationController *one=[[UINavigationController alloc]initWithRootViewController:[PageOneTableVC new]];
    UINavigationController *two=[[UINavigationController alloc]initWithRootViewController:[PageTwoVC new]];
    UINavigationController *three=[[UINavigationController alloc]initWithRootViewController:[PageThreeTableVC new]];
    UINavigationController *four=[[UINavigationController alloc]initWithRootViewController:[PageFourTableVC new]];
    UINavigationController *five=[[UINavigationController alloc]initWithRootViewController:[PageFiveVC new]];
    
    self.tab=[[UITabBarController alloc]init];
    NSArray *array=[NSArray arrayWithObjects:one,two,three,four,five, nil];
    self.tab.viewControllers=array;
    
    self.window.rootViewController=self.tab;
    
    // 添加button 覆盖 tabbar
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    
    self.button.frame = CGRectMake(self.window.frame.size.width/5 * 2, self.window.frame.size.height - 49, self.window.frame.size.width/5 ,49);
    [self.button addTarget:self action:@selector(btnAdd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:self.button];
    
    return YES;
}


- (void)btnAdd:(id)sender{
    
    // 创建编写游记界面
    TravelNotesTableVC *travelNotesTableVC = [TravelNotesTableVC new];
    
    UINavigationController *travelNotesNC=[[UINavigationController alloc]initWithRootViewController:travelNotesTableVC];
    [self.tab presentViewController:travelNotesNC animated:YES completion:nil];
    // 模态弹出编写游记 button 隐藏
    self.button.hidden = YES;
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
