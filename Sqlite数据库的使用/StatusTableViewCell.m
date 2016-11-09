//
//  StatusTableViewCell.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "StatusTableViewCell.h"

@implementation StatusTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    [self initStatus];
//}
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//    //    [self initStatus];
//    }
//    return self;
//}
+ (StatusTableViewCell *)cellWithTabelView:(UITableView *)tableView
{
    static NSString *identifier = @"StatusTableViewCell";
    StatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StatusTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(void)initStatus:(Status *)status{
  //  self.portraitImageview.image = [UIImage imageWithContentsOfFile:self.status.user.profileImageUrl];
    self.nameLabel.text = status.user.name;
    self.timeLabel.text =  status.createdAt;
    self.textForLabel.text = status.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
