//
//  HomeMenuCell.h
//  BY_iphone
//
//  Created by wuxinyi on 15/7/4.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^didSelectedSubItemAction)(NSIndexPath* indexPath);
@interface HomeMenuCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak)IBOutlet UICollectionView* collection;
@property(nonatomic,strong)NSArray* items;
@property(nonatomic,strong)didSelectedSubItemAction didselectAction;
-(void)setupTableViewCell;
@end
