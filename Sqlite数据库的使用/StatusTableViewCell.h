//
//  StatusTableViewCell.h
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Status.h"
@interface StatusTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageview;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *textForLabel;
@property(nonatomic,strong)Status *status;

+ (StatusTableViewCell *)cellWithTabelView:(UITableView *)tableView;
-(void)initStatus:(Status *)status;
@end
