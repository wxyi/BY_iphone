//
//  FullInfoCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PickTypeSelect)(NSIndexPath* indexPath);
@interface FullInfoCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet UILabel* namelab;
@property(nonatomic,weak)IBOutlet UITextField* Picktext;
@property(nonatomic,weak)IBOutlet UITextField* Fulltext;
@property(nonatomic,strong)NSIndexPath* indexPath;
@property(nonatomic,strong)PickTypeSelect pickselect;
@end
