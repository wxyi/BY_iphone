//
//  ApprovalProcessCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/13.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApprovalProcessCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel* leftNameLab;
@property(nonatomic,weak)IBOutlet UILabel* rightNameLab;
-(IBAction)addTag:(UIButton*)sender;
@end
