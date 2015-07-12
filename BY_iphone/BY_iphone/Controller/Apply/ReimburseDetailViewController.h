//
//  ReimburseDetailViewController.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/12.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReimburseDetailViewController : MyBaseViewController
@property(nonatomic,weak)IBOutlet UILabel* totalLab;
@property(nonatomic,weak)IBOutlet UILabel* deductLab;
@property(nonatomic,weak)IBOutlet UILabel* actualLab;
-(IBAction)nextBtn:(UIButton*)sender;
@end
