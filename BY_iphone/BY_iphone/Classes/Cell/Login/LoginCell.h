//
//  LoginCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^LoginSkipHome)(NSInteger tag);
@interface LoginCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet UITextField* userTextField;
@property(nonatomic,weak)IBOutlet UITextField* passwordTextField;
@property(nonatomic,strong)LoginSkipHome loginSkip;
-(IBAction)login:(UIButton*)sender;
@end
