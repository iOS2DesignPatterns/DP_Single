//
//  HGObject.m
//  DP_Single
//
//  Created by  ZhuHong on 2018/1/3.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGObject.h"
#import <objc/runtime.h>

@implementation HGObject

#pragma mark - NSCopying 协议方法
- (id)copyWithZone:(NSZone *)zone {
    HGObject* obj = [[self.class allocWithZone:zone] init];
//    obj.name = self.name;
    
    { // 查找所有的属性 (成员变量)   属性  != 成员变量
        unsigned int count = 0;
        Ivar* ivars = class_copyIvarList(self.class, &count);
        
        for (int i=0; i<count; i++) {
            const char* name = ivar_getName(ivars[i]);
            NSString* nameStr = [NSString stringWithUTF8String:name];
            [obj setValue:[self valueForKey:nameStr] forKey:nameStr];
        }
        
        free(ivars);
    }
    
    return obj;
}

// 这个方法一般情况下是不需要重写的，直接在copyWithZone:中处理即可。当然如果在的的子类的话，有特殊处理也是可以的
- (id)copy {
    id copyInstance = [super copy];

    NSLog(@"%@", copyInstance);
    return copyInstance;
}


#pragma mark - NSMutableCopying 协议方法
- (id)mutableCopyWithZone:(NSZone *)zone {
    return [self copyWithZone:zone];
}

// 这个方法一般情况下是不需要重写的，直接在mutableCopyWithZone:中处理即可。当然如果在的的子类的话，有特殊处理也是可以的
- (id)mutableCopy {
    id mutableCopyInstance = [super mutableCopy];
    
    NSLog(@"%@", mutableCopyInstance);
    return mutableCopyInstance;
}

@end
