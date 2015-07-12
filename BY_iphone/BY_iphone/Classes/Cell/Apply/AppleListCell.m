//
//  AppleListCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "AppleListCell.h"

@implementation AppleListCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupBadgeView:(NSString*)Badge
{
    self.BadgeView = [[NIBadgeView alloc] initWithFrame:CGRectZero];
    self.BadgeView.backgroundColor = [UIColor whiteColor];
    
    self.BadgeView.text = Badge;
    self.BadgeView.tintColor = [UIColor orangeColor];
    self.BadgeView.textColor = [UIColor whiteColor];
    [self.BadgeView sizeToFit];
    self.BadgeView.frame = CGRectMake(SCREEN_WIDTH-self.BadgeView.frame.size.width -30, 10, self.BadgeView.frame.size.width, self.BadgeView.frame.size.height);
    [self.contentView addSubview:self.BadgeView];
}
@end
