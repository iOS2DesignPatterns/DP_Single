//
//  SingleController.m
//  DP_Single
//
//  Created by  ZhuHong on 2018/1/3.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "SingleController.h"
#import "SingleObject.h"

@interface SingleController ()

@end

@implementation SingleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 代码小测试
    [self testCode];
}

// 代码小测试
- (void)testCode {
    // 对象1
    SingleObject* so01 = [SingleObject new];
    // 设置name
    so01.name = @"CoderHG";
    
    // 对象2 设置 name
    SingleObject* so02 = [SingleObject sharedInstance];
    // 设置name
    so02.name = @"CoderHG_02";
    // 对象3 没有设置 name
    SingleObject* so03 = [SingleObject new];
    
    // 打印结果
    NSLog(@"%@, %@, %@", so01.name, so02.name, so03.name);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    // 这么low的代码, 只有是在这种情况下才会写的
    switch (indexPath.row) {
        case 0:
            {
                SingleObject* so = [SingleObject sharedInstance];
                
                // 是不是每次的打印都一样呢
                NSLog(@"%@, %p", so, so);
            }
            break;
        case 1:
        {
            SingleObject* so = [SingleObject new];
            
            // 是不是每次的打印都一样呢
            NSLog(@"%@, %p", so, so);
        }
            break;
            
        case 2:
        {
            SingleObject* so = [[SingleObject alloc] init];
            
            // 是不是每次的打印都一样呢
            NSLog(@"%@, %p", so, so);
        }
            break;
        case 3:
        {
            SingleObject* so = [[SingleObject alloc] init];
            SingleObject* copySo = so.copy;
            
            // 是不是每次的打印都一样呢
            NSLog(@"%@, %p", copySo, copySo);
        }
            break;
            
        case 4:
        {
            SingleObject* so = [[SingleObject alloc] init];
            SingleObject* mutableCopySo = so.mutableCopy;
            
            // 是不是每次的打印都一样呢
            NSLog(@"%@, %p", mutableCopySo, mutableCopySo);
        }
            break;
            
        default:
            break;
    }
    
}

@end
