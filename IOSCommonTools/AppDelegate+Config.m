//
//  AppDelegate+Config.m
//  IOSCommonTools
//
//  Created by walker on 2018/5/4.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "IOSBaseViewController.h"
#import "TestResponserViewController.h"

@implementation AppDelegate (Config)

- (void)configTabbarVC {
    
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    
    UIViewController *firstVC = [[IOSBaseViewController alloc] init];
    //    firstVC.view.backgroundColor = [UIColor orangeColor];
    firstVC.title = @"第一个";
    
    
    UIViewController *secondVC = [[UIViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor grayColor];
    secondVC.title = @"第二个";
    secondVC.view.bounds = [UIScreen mainScreen].bounds;
    
    //    UITableViewController *tableView = [uitable]
    TestResponserViewController *testResponserVC = [[TestResponserViewController alloc] init];
    testResponserVC.title = @"第三个";
    testResponserVC.view.bounds = [UIScreen mainScreen].bounds;
    
    tabbarVc.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC,testResponserVC,nil];
    self.window.rootViewController = tabbarVc;
    [self.window makeKeyAndVisible];
}
@end
