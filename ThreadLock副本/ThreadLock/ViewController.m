//
//  ViewController.m
//  ThreadLock
//
//  Created by Jason on 16/2/24.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "BankAccount.h"

@interface ViewController ()
/**账户的信息*/
@property(nonatomic,strong)BankAccount *account;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createThread];
}

- (void)createThread
{
    //创建两个线程取钱
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(threadOne) object:nil];
    thread1.name = @"存折";
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(threadTwo) object:nil];
    thread2.name = @"银行卡";
    [thread1 start];
    [thread2 start];
}

- (void)threadOne
{
    [self.account takeMoneyFromAccount:8000];
}

- (void)threadTwo
{
    [self.account takeMoneyFromAccount:8000];
}

- (BankAccount *)account
{
    if (_account == nil) {
        _account = [[BankAccount alloc] init];
        _account.name = @"马云";
        _account.money = 10000;
    }
    return _account;
}

@end
