//
//  ApprovalProcessCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/13.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ApprovalProcessCell.h"

@implementation ApprovalProcessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)addTag:(UIButton*)sender
{
    sender.hidden = YES;
}
@end
