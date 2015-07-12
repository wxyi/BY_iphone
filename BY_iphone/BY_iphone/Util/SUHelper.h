//
//  SUHelper.h
//  SecondHandTradingMarket
//
//  Created by wuxinyi on 15-4-23.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id data, NSString *msg);
typedef void(^FailBlock)(NSString *msg);
@interface SUHelper : NSObject

+(SUHelper *)sharedInstance;

//系统初始化
-(void) sysInit:(void (^)(BOOL success))successBlock;


//提示

@end
