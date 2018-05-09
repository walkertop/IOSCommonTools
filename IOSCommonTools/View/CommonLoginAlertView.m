//
//  CommonLoginAlertView.m
//  CommonLoginAlertView
//
//  Created by walker on 18/2/1.
//  Copyright © 2017年 Youku. All rights reserved.
//

#import "CommonLoginAlertView.h"

static const CGFloat alertviewWidth  = 267;
static const CGFloat imageViewHeight = 180;
static const CGFloat buttonHeight    = 50;
static const CGFloat buttonWidth     = 133;

@interface CommonLoginAlertView()

//UI
@property (nonatomic, strong)     UIView * alertview;
@property (nonatomic, strong)     UIView * backgroundview;

//Data
@property (nonatomic, strong)     UIImage * image;
@property (nonatomic, copy)       successBlock successBlock;
@property (nonatomic, copy)       cancelBlock  cancelBlock;
@property (nonatomic, strong)     NSString * cancelButtonTitle;
@property (nonatomic, strong)     NSString * successButtonTitle;
@property (nonatomic, assign)     CGFloat alertviewWidth;

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

#pragma mark -  public function
- (void)show {
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self];
}

- (void)dismiss{
    [self removeFromSuperview];
}


#pragma mark -  private function
- (UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title Color: (UIColor *)color{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderWidth = 0.2;
    [button setTitleColor:color forState:UIControlStateNormal];
    
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
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

-(void)setupUI{
    self.backgroundview = [[UIView alloc] initWithFrame:self.frame];
    self.backgroundview.backgroundColor = [UIColor blackColor];
    self.backgroundview.alpha = 0.5;
    [self addSubview:self.backgroundview];
    
    self.alertview = [[UIView alloc] init];
    self.alertview.center = self.center;
    self.alertview.bounds = CGRectMake(0, 0, alertviewWidth, imageViewHeight + buttonHeight);
    self.alertview.layer.cornerRadius = 10;
    self.alertview.backgroundColor = [UIColor whiteColor];
    self.alertview.clipsToBounds = YES;
    
    [self addSubview:self.alertview];
    
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, alertviewWidth,imageViewHeight)];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.image = self.image;
    [self.alertview addSubview:imageview];
    
    CGRect successButtonFrame = CGRectMake(alertviewWidth / 2, imageViewHeight, buttonWidth,buttonHeight);
    if (self.successButtonTitle.length) {
        UIButton * successButton = [self createButtonWithFrame:successButtonFrame Title:self.successButtonTitle Color:[UIColor orangeColor]];
        successButton.titleLabel.textColor =[UIColor orangeColor];
        successButton.tag = 0;
        [self.alertview addSubview:successButton];
    }
    CGRect cancelButtonFrame = CGRectMake(0, imageViewHeight,buttonWidth,buttonHeight);
    
    if (self.cancelButtonTitle.length) {
        UIButton * cancelButton = [self createButtonWithFrame:cancelButtonFrame Title:self.cancelButtonTitle Color:[UIColor blackColor]];
        cancelButton.tag = 1;
        [self.alertview addSubview:cancelButton];
    }
}

@end

