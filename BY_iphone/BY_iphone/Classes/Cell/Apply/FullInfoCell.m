//
//  FullInfoCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "FullInfoCell.h"

@implementation FullInfoCell

- (void)awakeFromNib {
    // Initialization code
    self.Fulltext.delegate = self;
    
    
    UIView* pickView = [[UIView alloc]initWithFrame:CGRectMake(0,0,31,30)];
    UIImageView *pickImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    pickImage.image = [UIImage imageNamed:@"btn_down.png"];
    [pickView addSubview:pickImage];
    self.Picktext.rightView = pickView;
    self.Picktext.delegate = self;
    self.Picktext.rightViewMode = UITextFieldViewModeAlways;
    self.Picktext.layer.cornerRadius=1.0f;
    self.Picktext.layer.masksToBounds=YES;
    self.Picktext.layer.borderColor=[[UIColor redColor]CGColor];
    self.Picktext.layer.borderWidth= 1.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.Fulltext) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 32) {
            return NO;
        }
    }
    
    return YES;
}

@end
