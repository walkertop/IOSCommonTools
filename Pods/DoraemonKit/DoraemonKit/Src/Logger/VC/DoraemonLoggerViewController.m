//
//  DoraemonLoggerViewController.m
//  DoraemonKit-DoraemonKit
//
//  Created by yixiang on 2017/12/12.
//

#import "DoraemonLoggerViewController.h"
#import "DoraemonDefine.h"
#import "UIView+Positioning.h"
#import "DoraemonCacheManager.h"
#import "DoraemonLoggerConsoleWindow.h"

@interface DoraemonLoggerViewController ()

@end

@implementation DoraemonLoggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}

- (void)initData{

}

- (void)initUI{
    self.title = @"日志显示开关";
    
    UISwitch *switchView = [[UISwitch alloc] init];
    switchView.origin = CGPointMake(DoraemonScreenWidth/2-switchView.width/2, DoraemonScreenHeight/2-switchView.height/2);
    [self.view addSubview:switchView];
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    switchView.on = [[DoraemonCacheManager sharedInstance] loggerSwitch];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.font = [UIFont systemFontOfSize:16];
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.text = @"点我右侧😘:  ";
    [self.view addSubview:tipLabel];
    [tipLabel sizeToFit];
    tipLabel.origin = CGPointMake(switchView.left-10-tipLabel.width, DoraemonScreenHeight/2-tipLabel.height/2);
}

- (void)switchAction:(id)sender{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    [[DoraemonCacheManager sharedInstance] saveLoggerSwitch:isButtonOn];
    if(isButtonOn){
        
        [[DoraemonLoggerConsoleWindow shareInstance] show];
    }else{
        
        [[DoraemonLoggerConsoleWindow shareInstance] hide];
    }
}

@end
