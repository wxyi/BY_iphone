//
//  ProcessStartCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProcessStartCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet UILabel* processLab;
@property(nonatomic,weak)IBOutlet UITextField* processtext;
@end
