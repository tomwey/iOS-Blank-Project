//
//  ViewController.m
//  iOS-Blank-Project
//
//  Created by tangwei1 on 16/3/1.
//  Copyright © 2016年 tangwei1. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+AWDeallocBlockExecutor.h"

@interface Person : NSObject

@end

@implementation Person

- (void)dealloc
{
    NSLog(@"释放person");
    [super dealloc];
}

@end

@interface CustomView : UIView

@property (nonatomic, retain) Person* person;

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CustomView* cv = [[CustomView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [self.view addSubview:cv];
    [cv release];
    cv.backgroundColor = [UIColor redColor];
    
    cv.person = [[[Person alloc] init] autorelease];
    
    __block CustomView* weakSelf = cv;
    [cv addDeallocExecuteBlock:^{
        weakSelf.person = nil;
    }];
    
    [cv performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:5.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

@implementation CustomView

- (void)dealloc
{
    NSLog(@"释放了...");
    [super dealloc];
}

@end
