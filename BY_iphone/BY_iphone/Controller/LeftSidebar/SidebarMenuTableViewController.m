//
//  SidebarMenuTableViewController.m
//  CHG_iphone
//
//  Created by wuxinyi on 15/5/21.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "SidebarMenuTableViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "PersonalInformationViewController.h"
#import "BankCardInfoViewController.h"
#import "SettingViewController.h"
@interface SidebarMenuTableViewController ()

@end

@implementation SidebarMenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.tableView.backgroundColor = UIColorFromRGB(0xdddddd);
 
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *backImageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    [backImageView setImage:[UIImage imageNamed:@"bg_personal_center.png"]];
    self.tableView.backgroundView=backImageView;
    self.tableView.opaque = NO;
    
    [NSObject setExtraCellLineHidden:self.tableView];
//    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        
        view.backgroundColor = [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"icon_logo_personal_center.png"];
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        [view addSubview:imageView];
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"博彦办公助手";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [view addSubview:label];
        view;
    });
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    if (indexPath.row == 0) {
        DLog(@"基本信息");
        PersonalInformationViewController* PersonalInformation = [[PersonalInformationViewController alloc] initWithNibName:@"PersonalInformationViewController" bundle:nil];
        [navigationController pushViewController:PersonalInformation animated:YES];
    }
    else if (indexPath.row == 1 ) {
        DLog(@"银行卡");
        BankCardInfoViewController* BankCardInfo = [[BankCardInfoViewController alloc] initWithNibName:@"BankCardInfoViewController" bundle:nil];
        [navigationController pushViewController:BankCardInfo animated:YES];
    }
    else {
        DLog(@"设置");
        SettingViewController* SettingView = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
        [navigationController pushViewController:SettingView animated:YES];
    }

    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
//    if ([self.config.Roles isEqualToString:@"SHOPSELLER"]){
//        return 2;
//    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    cell.backgroundColor = UIColorFromRGB(0xf0f0f0);
    cell.backgroundColor = [UIColor clearColor];
    NSArray *titles = @[@"个人信息",@"银行卡",@"设置"];
    NSArray *images = @[@"icon_personal_information.png",@"icon_bank_card.png",@"icon_install.png"];
//    if ([self.config.Roles isEqualToString:@"SHOPSELLER"]){
//        titles = @[@"我的信息", @"设置"];
//    }
//    else
//    {
//        titles = @[@"我的信息", @"银行卡", @"我的账户", @"设置"];
//    }
    cell.textLabel.text = titles[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = FONT(16);
    
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }

}

@end
