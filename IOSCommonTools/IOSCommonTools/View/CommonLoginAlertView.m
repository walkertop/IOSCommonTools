//
//  CommonLoginAlertView.m
//  CommonLoginAlertView
//
//  Created by walker on 18/2/1.
//  Copyright © 2017年 Youku. All rights reserved.
//

#import "CommonLoginAlertView.h"

static const CGFloat alertviewWidth = 267;
static const CGFloat imageviewHeight = 180;
static const CGFloat buttonHeight = 50;
static const CGFloat buttonWidth = 133;

@interface CommonLoginAlertView()

@property (strong,nonatomic)UIView * alertview;
@property (strong,nonatomic)UIView * backgroundview;
@property (strong,nonatomic)NSString * cancelButtonTitle;
@property (strong,nonatomic)NSString * successButtonTitle;
@property (strong,nonatomic)UIImage * image;
@property(nonatomic, assign) CGFloat alertviewWidth;
@property(nonatomic, copy) successBlock successBlock;
@property(nonatomic, copy) cancelBlock  cancelBlock;

@end

@implementation CommonLoginAlertView

#pragma mark -  init
- (instancetype)initWithImage:(UIImage *)image
                 cancelButton:(NSString *)cancelButton
                       cancel: (cancelBlock)cancelBlock
           successButtonTitle:(NSString *)successButton
                      success: (successBlock)successBlock {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]   ) {
        self.image = image;
        self.cancelButtonTitle = cancelButton;
        self.successButtonTitle = successButton;
        self.cancelBlock = cancelBlock;
        self.successBlock = successBlock;
        [self setupUI];
    }
    return self;
}

#pragma mark -  private function
- (UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title color: (UIColor *)color{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderWidth = 0.2;
    [button setTitleColor:color forState:UIControlStateNormal];
    
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)show {
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self];
}

- (void)clickButton:(UIButton *)button{
    if (button.tag == 0 ) {
        if (self.successBlock) {
            self.successBlock();
        }
    } else if (button.tag == 1) {
        if (self.cancelBlock) {
            self.cancelBlock();
        }
    }
    [self removeFromSuperview];
}

- (void)dismiss{
    [self removeFromSuperview];
}

-(void)setupUI{
    self.backgroundview = [[UIView alloc] initWithFrame:self.frame];
    self.backgroundview.backgroundColor = [UIColor blackColor];
    self.backgroundview.alpha = 0.5;
    [self addSubview:self.backgroundview];
    
    self.alertview = [[UIView alloc] init];
    self.alertview.center = self.center;
    self.alertview.bounds = CGRectMake(0, 0, alertviewWidth, imageviewHeight + buttonHeight);
    self.alertview.layer.cornerRadius = 10;
    self.alertview.backgroundColor = [UIColor whiteColor];
    self.alertview.clipsToBounds = YES;
    
    [self addSubview:self.alertview];
    
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, alertviewWidth,imageviewHeight)];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.image = self.image;
    [self.alertview addSubview:imageview];
    
    CGRect successButtonFrame = CGRectMake(alertviewWidth / 2, imageviewHeight, buttonWidth,buttonHeight);
    if (self.successButtonTitle.length) {
        UIButton * successButton = [self createButtonWithFrame:successButtonFrame Title:self.successButtonTitle color:[UIColor orangeColor]];
        successButton.titleLabel.textColor =[UIColor orangeColor];
        successButton.tag = 0;
        [self.alertview addSubview:successButton];
    }
    CGRect cancelButtonFrame = CGRectMake(0, imageviewHeight,buttonWidth,buttonHeight);
    
    if (self.cancelButtonTitle.length) {
        UIButton * cancelButton = [self createButtonWithFrame:cancelButtonFrame Title:self.cancelButtonTitle color:[UIColor blackColor]];
        cancelButton.tag = 1;
        [self.alertview addSubview:cancelButton];
    }
}

#pragma mark -  private
- (void)successButtonAction:(id)sender {
    if (self.successBlock) {
        self.successBlock();
        [self removeFromSuperview];
    }
}

- (void)cancelButtonAction:(id)sender {
    if (self.cancelBlock) {
        self.cancelBlock();
        [self removeFromSuperview];
    }
}

@end
