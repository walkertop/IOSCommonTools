//
//  UIView+Additions.m
//  IOSCommonTools
//
//  Created by walker彬 on 2018/7/12.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (UIViewController*)parentController {
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

@end
