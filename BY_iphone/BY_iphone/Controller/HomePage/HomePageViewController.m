//
//  HomePageViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/4.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "HomePageViewController.h"
#import "CHGNavigationController.h"
#import "HomeMenuCell.h"

#import "ApplyListViewController.h"
@interface HomePageViewController ()
@property UINib* HomeMenuNib;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"首页";
//    if (IOS_VERSION >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    //    setSafeKitLogType(SafeKitLogTypeDebugger);
    //    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x171c61);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    //    self.navigationController.navigationBar.layer.contents = (id)[NSObject createImageWithColor:UIColorFromRGB(0x171c61)].CGImage;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_btn.png"] style:UIBarButtonItemStylePlain target:(CHGNavigationController *)self.navigationController action:@selector(showMenu)];
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView
{
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.HomeMenuNib = [UINib nibWithNibName:@"HomeMenuCell" bundle:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    HomeMenuCell *cell=[tableView dequeueReusableCellWithIdentifier:@"HomeMenuCell"];
    if(cell==nil){
        cell = (HomeMenuCell*)[[self.HomeMenuNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    [cell setupTableViewCell];
    
    cell.didselectAction = ^(NSIndexPath* indexPath){
    
        [weakSelf didSelectColCellItem:indexPath];
    };
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREEN_WIDTH* 0.4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_HEIGHT - SCREEN_WIDTH* 0.4;
}
-(void)didSelectColCellItem:(NSIndexPath*)indexpath
{
    if (indexpath.row == 0) {
        DLog(@"申请");
        ApplyListViewController *ApplyListView = [[ApplyListViewController alloc] initWithNibName:@"ApplyListViewController" bundle:nil];
        [self.navigationController pushViewController:ApplyListView animated:YES];
    }
    else if (indexpath.row == 1) {
        DLog(@"办公");
    }
    else if (indexpath.row == 2) {
        DLog(@"考勤");
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
