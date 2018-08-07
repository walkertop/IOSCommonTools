//
//  TestResponserViewController.m
//  IOSCommonTools
//
//  Created by walker彬 on 2018/7/12.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "TestResponserViewController.h"

@interface TestResponserViewController ()

@property(nonatomic, strong) UIButton *testResponserButton;
@end

@implementation TestResponserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.nextResponder);
    NSLog(@"%@",self.view.nextResponder);
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    [self.view addSubview:self.testResponserButton];
}

- (UIButton *)testResponserButton {
    if (!_testResponserButton) {
        _testResponserButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _testResponserButton.frame = CGRectMake(44, 20, 40, 40);
        _testResponserButton.backgroundColor = [UIColor blueColor];
    }
    return _testResponserButton;
}

@end
