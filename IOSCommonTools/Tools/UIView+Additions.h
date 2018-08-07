//
//  UIView+Additions.h
//  IOSCommonTools
//
//  Created by walker彬 on 2018/7/12.
//  Copyright © 2018年 walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)


//responser chains
// 响应者链条为VC时，返回VC的Class
- (UIViewController*)parentController;
@end
