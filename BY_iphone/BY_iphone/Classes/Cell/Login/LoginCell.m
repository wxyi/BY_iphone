//
//  LoginCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

- (void)awakeFromNib {
    // Initialization code
    
    UIView* userView = [[UIView alloc]initWithFrame:CGRectMake(0,0,31,40)];
    UIImageView *userImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 11, 14)];
    userImage.image = [UIImage imageNamed:@"icon_Account_login.png"];
    [userView addSubview:userImage];
    UIView* passwordView = [[UIView alloc]initWithFrame:CGRectMake(0,0,31,40)];
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 11, 14)];
    passwordImage.image = [UIImage imageNamed:@"icon_Password_login.png"];
    [passwordView addSubview:passwordImage];
    self.userTextField.leftView = userView;
    
    self.userTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.passwordTextField.leftView = passwordView;
    
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;

    self.userTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.userTextField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 32) {
            return NO;
        }
    }
    else if (textField == self.passwordTextField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 16) {
            return NO;
        }
    }
    return YES;
}
-(IBAction)login:(UIButton*)sender
{
    DLog(@"登陆");
    if (self.loginSkip) {
        self.loginSkip(sender.tag);
    }
}
@end
