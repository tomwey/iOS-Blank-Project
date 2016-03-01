//
//  NSObject+AWDeallocBlockExecutor.h
//  iOS-Blank-Project
//
//  Created by tangwei1 on 16/3/1.
//  Copyright © 2016年 tangwei1. All rights reserved.
//

#import <Foundation/Foundation.h>

// 在一个对象的dealloc方法中动态添加执行代码块
typedef void (^DeallocExecuteBlock)(void);

@interface  AWDeallocBlockExecutor : NSObject

- (id)initWithBlock:(DeallocExecuteBlock)executeBlock;

@end

@interface NSObject (AWDeallocBlockExecutor)

- (void)addDeallocExecuteBlock:(DeallocExecuteBlock)executeBlock;

@end
