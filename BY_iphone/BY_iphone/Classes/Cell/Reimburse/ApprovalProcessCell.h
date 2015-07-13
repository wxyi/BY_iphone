//
//  ApprovalProcessCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/13.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOTag.h"
@interface ApprovalProcessCell : UITableViewCell<AOTagDelegate>
@property(nonatomic,weak)IBOutlet UILabel* leftNameLab;
@property(nonatomic,weak)IBOutlet UILabel* rightNameLab;
@property(nonatomic,weak)IBOutlet UIButton* addbtn;
@property(nonatomic,strong) AOTagList *AOTag;
-(IBAction)addTag:(UIButton*)sender;
@end
