//
//  CopyController.m
//  DP_Single
//
//  Created by  ZhuHong on 2018/1/3.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "CopyController.h"
#import "HGObject.h"

@interface CopyController ()

@property (nonatomic, strong) HGObject* hgObject;

@end

@implementation CopyController

#pragma mark - lazy
- (HGObject *)hgObject {
    if (!_hgObject) {
//        _hgObject = [HGObject new]; 等同
        _hgObject = [[HGObject alloc] init];
        _hgObject.name = @"CoderHG";
    }
    return _hgObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试小代码
    [self test];
}

// 测试小代码
- (void)test {
    NSArray* hgArray = @[@"HGArray", @"Array"];
    NSArray* hgcCopyArray = hgArray.copy;
    NSMutableArray* hgcMutableArray = hgArray.mutableCopy;
    
    NSLog(@"%@---%p,\n%@---%p,\n %@---%p",hgArray, hgArray, hgcCopyArray, hgcCopyArray, hgcMutableArray, hgcMutableArray);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        HGObject* hgObject = self.hgObject.copy;
        NSLog(@"%@", hgObject.name);
    } else {
        HGObject* hgMutableObject = self.hgObject.mutableCopy;
        NSLog(@"%@", hgMutableObject.name);
    }
}


@end
