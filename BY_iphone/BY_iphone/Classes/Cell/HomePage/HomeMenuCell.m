//
//  HomeMenuCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/4.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "HomeMenuCell.h"
#import "HomeMenuColCell.h"
@implementation HomeMenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupTableViewCell
{

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"sysmenu" ofType:@"plist"];
    self.items = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    
    [self modifyCollectionView:NO];
    self.collection.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH* 0.4);
    DLog(@"self.MenuCollection.frame = %@",NSStringFromCGRect(self.collection.frame) );
    [self.collection registerNib:[UINib nibWithNibName:@"HomeMenuColCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    self.collection.delegate = self;
    self.collection.dataSource=self;
    self.collection.scrollEnabled = NO;
}
-(void) modifyCollectionView:(BOOL) isH{
    
    UIImageView *backImageView=[[UIImageView alloc]initWithFrame:self.bounds];
    [backImageView setImage:[UIImage imageNamed:@"bg_home_page.png"]];
    self.collection.backgroundView=backImageView;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake((SCREEN_WIDTH-2)/3,  SCREEN_WIDTH* 0.4)];
    [flowLayout setMinimumLineSpacing:1.f];
    [flowLayout setMinimumInteritemSpacing:0.f];
    [self.collection setCollectionViewLayout:flowLayout];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeMenuColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageName.text = [[self.items objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:[[self.items objectAtIndex:indexPath.row] objectForKey:@"icon"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.didselectAction) {
        self.didselectAction(indexPath);
    }
}
@end
