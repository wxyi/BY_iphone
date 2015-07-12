//
//  FullSubInfoCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "FullSubInfoCell.h"

@implementation FullSubInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.nametext) {
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
-(void)setupFullCell
{
    UIView* pickView = [[UIView alloc]initWithFrame:CGRectMake(0,0,30,30)];
    UIImageView *pickImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    pickImage.image = [UIImage imageNamed:@"btn_down.png"];
    [pickView addSubview:pickImage];
    self.nametext.rightView = pickView;
    self.nametext.delegate = self;
    self.nametext.rightViewMode = UITextFieldViewModeAlways;
    self.nametext.layer.cornerRadius=1.0f;
    self.nametext.layer.masksToBounds=YES;
    self.nametext.layer.borderColor=[[UIColor redColor]CGColor];
    self.nametext.layer.borderWidth= 1.0f;
}
@end
