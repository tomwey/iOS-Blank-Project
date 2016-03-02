//
//  UINavigationController+StatusBarStyle.m
//  iOS-Blank-Project
//
//  Created by tangwei1 on 16/3/2.
//  Copyright © 2016年 tangwei1. All rights reserved.
//

#import "UINavigationController+StatusBarStyle.h"

@implementation UINavigationController (StatusBarStyle)
// 设置导航条控制器为rootViewController时的状态栏样式，
// 如果添加该分类，可以用self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
