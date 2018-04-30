//
//  CommonLoginAlertView.h
//  YKDetail
//
//  Created by walker on 18/2/1.
//  Copyright © 2017年 Youku. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^successBlock)(void);
typedef void (^cancelBlock)(void);

@interface CommonLoginAlertView : UIView

- (instancetype)initWithImage:(UIImage *)image
                 cancelButton:(NSString *)cancelButton
                       cancel: (cancelBlock)cancelBlock
           successButtonTitle:(NSString *)successButton
                      success: (successBlock)successBlock;
- (void)show;

@end
