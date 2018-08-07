//
//  IOSBaseViewController.m
//  IOSCommonTools
//
//  Created by walker on 2018/5/4.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "IOSBaseViewController.h"

@interface IOSBaseViewController ()

@end

@implementation IOSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%@",self.nextResponder);
    NSLog(@"%@",self.view.nextResponder);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - lazy




@end
