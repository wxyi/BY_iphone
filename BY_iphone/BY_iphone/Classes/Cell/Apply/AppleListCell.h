//
//  AppleListCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIBadgeView.h"
@interface AppleListCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UIImageView* iconimage;
@property(nonatomic,weak)IBOutlet UILabel* titlelab;
@property(nonatomic,weak)IBOutlet UIImageView* arrowimage;
@property(nonatomic,strong)NIBadgeView* BadgeView;
-(void)setupBadgeView:(NSString*)Badge;
@end
