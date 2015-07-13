//
//  ApprovalProcessCell.m
//  BY_iphone
//
//  Created by wuxinyi on 15/7/13.
//  Copyright (c) 2015年 wuxinyi. All rights reserved.
//

#import "ApprovalProcessCell.h"

@implementation ApprovalProcessCell

- (void)awakeFromNib {
    // Initialization code
    self.AOTag = [[AOTagList alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-90)/2,
    0,
    90,
    50)];
    
    [self.AOTag setDelegate:self];
    [self addSubview:self.AOTag];
    self.AOTag.hidden = YES;
//    [_tagWriteView setBackgroundColor:[UIColor yellowColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)addTag:(UIButton*)sender
{
    sender.hidden = YES;
    self.AOTag.hidden = NO;
    
    [self.AOTag addTag:@"武新义" withImage:@"btn_Add_Tags_hl.png"];
}
#pragma mark - Tag delegate

- (void)tagDidAddTag:(AOTag *)tag
{
    NSLog(@"Tag > %@ has been added", tag);
}

- (void)tagDidRemoveTag:(AOTag *)tag
{
    NSLog(@"Tag > %@ has been removed", tag);
    self.addbtn.hidden = NO;
    self.AOTag.hidden = YES;
}

- (void)tagDidSelectTag:(AOTag *)tag
{
    NSLog(@"Tag > %@ has been selected", tag);
}

#pragma mark - Tag delegate

- (void)tagDistantImageDidLoad:(AOTag *)tag
{
    NSLog(@"Distant image has been downloaded for tag > %@", tag);
}

- (void)tagDistantImageDidFailLoad:(AOTag *)tag withError:(NSError *)error
{
    NSLog(@"Distant image has failed to download > %@ for tag > %@", error, tag);
}
@end
