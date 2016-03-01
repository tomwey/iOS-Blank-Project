//
//  NSObject+AWDeallocBlockExecutor.m
//  iOS-Blank-Project
//
//  Created by tangwei1 on 16/3/1.
//  Copyright © 2016年 tangwei1. All rights reserved.
//

#import "NSObject+AWDeallocBlockExecutor.h"
#import <objc/runtime.h>

@interface AWDeallocBlockExecutor ()

@property (nonatomic, copy) DeallocExecuteBlock executeBlock;

@end

@implementation AWDeallocBlockExecutor

- (id)initWithBlock:(DeallocExecuteBlock)executeBlock
{
    if ( self = [super init] ) {
        // 块对象默认是放到栈中的，这里需要通过copy放到内存堆中，以方便后续使用
        _executeBlock = [executeBlock copy];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"释放Executor对象");
    if ( _executeBlock ) {
        _executeBlock();
    }
    
    [_executeBlock release];
    _executeBlock = nil;
    
    [super dealloc];
}

@end

@implementation NSObject (AWDeallocBlockExecutor)

const void * kDeallocBlockKey = &kDeallocBlockKey;
- (void)addDeallocExecuteBlock:(DeallocExecuteBlock)executeBlock
{
    if ( !executeBlock ) return;
    AWDeallocBlockExecutor* executor = [[AWDeallocBlockExecutor alloc] initWithBlock:executeBlock];
    objc_setAssociatedObject(self, kDeallocBlockKey, executor, OBJC_ASSOCIATION_RETAIN);
    [executor release];
}

@end
