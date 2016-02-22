//
//  AWBaseViewController.m
//  Cute&Funny
//
//  Created by tangwei1 on 15-4-17.
//  Copyright (c) 2015年 tangwei1. All rights reserved.
//

#import "AWBaseViewController.h"

@implementation AWBaseViewController
{
    UIView* _contentSubview;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ( self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ) {
        if ( [self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)] ) {
            // 关闭UIScrollView的自动内间距
//            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    
    return self;
}

- (void)dealloc
{
#if DEBUG
    NSLog(@"#### %@ dealloc ####", NSStringFromClass([self class]));
#endif
    
    // 移除该页面上所有的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    if ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ) {
        self.contentSubview.frame = CGRectMake(
                                               0,
                                               self.topLayoutGuide.length,
                                               CGRectGetWidth(self.view.frame),
                                               CGRectGetHeight(self.view.frame) -
                                               self.topLayoutGuide.length -
                                               self.bottomLayoutGuide.length);
    }
}

- (UIView *)contentSubview
{
    if ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ) { // iOS 7.0以下使用根视图
        return self.view;
    }
    
    if ( nil == _contentSubview ) {
        _contentSubview = [[UIView alloc] init];
        [self.view addSubview:_contentSubview];
        [_contentSubview release];
        
        [self.view sendSubviewToBack:_contentSubview];
    }
    
    return _contentSubview;
}

@end
