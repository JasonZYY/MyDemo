//
//  BankAccount.m
//  ThreadLock
//
//  Created by Jason on 16/2/24.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

- (void)takeMoneyFromAccount:(float)money
{
    //使用@synchronized解决多个线程修改同一块资源的问题
    @synchronized(self) {
        if (self.money >= money) {
            //模拟取钱耗时操作
            [NSThread sleepForTimeInterval:1];
            self.money -= money;
            NSLog(@"%@取了%.2f元,剩余%.2f元",[NSThread currentThread].name,money,self.money);
        }else{
            NSLog(@"余额不足,请充值");
        }
    }
}

@end
