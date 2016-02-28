//
//  BankAccount.h
//  ThreadLock
//
//  Created by Jason on 16/2/24.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

/**账户姓名*/
@property(nonatomic,copy)NSString *name;
/**余额*/
@property(nonatomic,assign)float money;

/**取钱*/
- (void)takeMoneyFromAccount:(float)money;

@end
