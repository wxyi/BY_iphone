//
//  LoginViewController.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/11.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginCell.h"


#import "CHGNavigationController.h"
#import "REFrostedViewController.h"
#import "SidebarMenuTableViewController.h"
#import "HomePageViewController.h"

@interface LoginViewController ()
@property UINib* LoginNib;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView
{

    self.tableview.delegate = self;
    self.tableview.dataSource =self;
    self.tableview.scrollEnabled = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *backImageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    [backImageView setImage:[UIImage imageNamed:@"bg_login.png"]];
    self.tableview.backgroundView=backImageView;
    self.LoginNib = [UINib nibWithNibName:@"LoginCell" bundle:nil];
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
    LoginCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LoginCell"];
    if(cell==nil){
        cell = (LoginCell*)[[self.LoginNib instantiateWithOwner:self options:nil] objectAtIndex:0];
        
    }
    
    cell.loginSkip = ^(NSInteger tag){
        
        [weakSelf login];
    };
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_WIDTH * 0.8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* v_header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH* 0.8)];
    v_header.backgroundColor = [UIColor clearColor];
    UIImageView* image = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_WIDTH* 0.8 -100)/2, 100, 100)];
    image.image = [UIImage imageNamed:@"icon_logo_login.png"];
    [v_header addSubview:image];
    
    UILabel* titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, image.frame.origin.y + CGRectGetHeight(image.frame) + 13, SCREEN_WIDTH, 40)];
    titleLab.text = @"博彦办公助手";
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font = FONT(20);
    titleLab.textAlignment = NSTextAlignmentCenter;
    
    [v_header addSubview:titleLab];
    return v_header;
}

-(void)login
{
    [self setupHomePageViewController];
}

-(void)setupHomePageViewController
{
    CHGNavigationController *navigationController = [[CHGNavigationController alloc] initWithRootViewController:[[HomePageViewController alloc] init]];
    
    SidebarMenuTableViewController *SidebarMenu = [[SidebarMenuTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    // Create frosted view controller
    //
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navigationController menuViewController:SidebarMenu];
    
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    frostedViewController.limitMenuViewSize = YES;
    // Make it a root controller
    //
    [self presentViewController:frostedViewController animated:YES completion:^{

    }];

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
