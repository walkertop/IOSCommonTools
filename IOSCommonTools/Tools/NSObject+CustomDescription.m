//
//  NSObject+CustomDescription.m
//  IOSCommonTools
//
//  Created by walker on 2018/5/15.
//  Copyright © 2018年 walker. All rights reserved.
//

#import "NSObject+CustomDescription.h"
#import <objc/runtime.h>

@implementation NSObject (CustomDescription)

- (NSString *)debugDescription {
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSNumber class]] || [self isKindOfClass:[NSString class]]) {
        return self.debugDescription;
    }
    //初始化一个字典
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    //得到当前class的所有属性
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i<count; i++) { //循环并用KVC得到每个属性的值
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        id value = [self valueForKey:name]?:@"nil";//默认值为nil字符串
        [dictionary setObject:value forKey:name];//装载到字典里
    }
    //释放
    free(properties);
    //return
    return [NSString stringWithFormat:@"<%@: %p> -- %@",[self class],self,dictionary];
}

@end
