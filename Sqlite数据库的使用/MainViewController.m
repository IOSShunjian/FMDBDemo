//
//  MainViewController.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "MainViewController.h"
#import "SqliteManager.h"
#import "SqliteDatabaseCreator.h"
#import "User.h"
#import "Status.h"
#import "UserService.h"
#import "StatusService.h"
#import "StatusTableViewCell.h"
//#import "StatusTableViewCell.h"
@interface MainViewController ()
{
 BOOL isEdit ;   //是否是编辑状态
}
  @property(nonatomic,strong) NSMutableArray *statuses;
  @property(nonatomic,strong) NSMutableArray *statusCells;



@end
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据库演示";
    isEdit = NO;
    UIButton * bt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [bt setTitle:@"添加行" forState:UIControlStateNormal] ;
    [bt addTarget:self action:@selector(addTableviewCell) forControlEvents:UIControlEventTouchUpInside];
   // [bt setFont:[UIFont systemFontOfSize:14.0f]];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIBarButtonItem * barItem = [[UIBarButtonItem alloc]initWithCustomView:bt];
    self.navigationItem.rightBarButtonItem = barItem;
    
    [SqliteDatabaseCreator initDatabase];
    
    //    [self addUsers];
    //    [self removeUser];
    //    [self modifyUserInfo];
    
        [self addStatus];
    
    [self loadStatusData];
    
}

-(void)addTableviewCell{
    isEdit = !isEdit;
    if (isEdit) {
        self.tableView.editing = YES;

    }
    else {
        self.tableView.editing = NO;

    }
    NSLog(@"addTableviewCell");
    [self.tableView reloadData];

}

-(void)addUsers{
    User *user1=[User userWithName:@"Binger" screenName:@"冰儿" profileImageUrl:@"binger.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[UserService shareUserService] addUser:user1];
    User *user2=[User userWithName:@"Xiaona" screenName:@"小娜" profileImageUrl:@"xiaona.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[UserService shareUserService] addUser:user2];
    User *user3=[User userWithName:@"Lily" screenName:@"丽丽" profileImageUrl:@"lily.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[UserService shareUserService] addUser:user3];
    User *user4=[User userWithName:@"Qianmo" screenName:@"阡陌" profileImageUrl:@"qianmo.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[UserService shareUserService] addUser:user4];
    User *user5=[User userWithName:@"Yanyue" screenName:@"炎月" profileImageUrl:@"yanyue.jpg" mbtype:@"mbtype.png" city:@"北京"];
    [[UserService shareUserService] addUser:user5];
}
-(void)insertStatus{
    Status *status1=[Status statusWithCreateAt:@"9:00" source:@"iPhone 6" text:@"一只雪猴在日本边泡温泉边玩iPhone的照片，获得了\"2014年野生动物摄影师\"大赛特等奖。一起来为猴子配个词" userId:1];
}
-(void)addStatus{
    Status *status1=[Status statusWithCreateAt:@"9:00" source:@"iPhone 6" text:@"一只雪猴在日本边泡温泉边玩iPhone的照片，获得了\"2014年野生动物摄影师\"大赛特等奖。一起来为猴子配个词" userId:1];
    [[StatusService shareStatusService] addStatus:status1];
    Status *status3=[Status statusWithCreateAt:@"9:30" source:@"iPhone 6" text:@"【我们送iPhone6了 要求很简单】真心回馈粉丝，小编觉得现在最好的奖品就是iPhone6了。今起到12月31日，关注我们，转发微博，就有机会获iPhone6(奖品可能需要等待)！每月抽一台[鼓掌]。不费事，还是试试吧，万一中了呢" userId:2];
    [[StatusService shareStatusService] addStatus:status3];
    Status *status4=[Status statusWithCreateAt:@"9:45" source:@"iPhone 6" text:@"重大新闻：蒂姆库克宣布出柜后，ISIS战士怒扔iPhone，沙特神职人员呼吁人们换回iPhone 4。[via Pan-Arabia Enquirer]" userId:3];
    [[StatusService shareStatusService] addStatus:status4];
    Status *status5=[Status statusWithCreateAt:@"10:05" source:@"iPhone 6" text:@"小伙伴们，有谁知道怎么往Iphone4S里倒东西？倒入的东西又该在哪里找？用了Iphone这么长时间，还真的不知道怎么弄！有谁知道啊？谢谢！" userId:4];
    [[StatusService shareStatusService] addStatus:status5];
    Status *status6=[Status statusWithCreateAt:@"10:07" source:@"iPhone 6" text:@"在音悦台iPhone客户端里发现一个悦单《Infinite 金明洙》，推荐给大家! " userId:1];
    [[StatusService shareStatusService] addStatus:status6];
    Status *status7=[Status statusWithCreateAt:@"11:20" source:@"iPhone 6" text:@"如果sony吧mp3播放器产品发展下去，不贪图手头节目源的现实利益，就木有苹果的ipod，也就木有iphone。柯达类似的现实利益，不自我革命的案例也是一种巨头的宿命。" userId:2];
    [[StatusService shareStatusService] addStatus:status7];
    Status *status8=[Status statusWithCreateAt:@"13:00" source:@"iPhone 6" text:@"【iPhone 7 Plus】新买的iPhone 7 Plus ，如何？够酷炫么？" userId:2];
    [[StatusService shareStatusService] addStatus:status8];
    Status *status9=[Status statusWithCreateAt:@"13:24" source:@"iPhone 6" text:@"自拍神器#卡西欧TR500#，tr350S～价格美丽，行货，全国联保～iPhone6 iPhone6Plus卡西欧TR150 TR200 TR350 TR350S全面到货 招收各种代理！[给力]微信：39017366" userId:3];
    [[StatusService shareStatusService] addStatus:status9];
    Status *status10=[Status statusWithCreateAt:@"13:26" source:@"iPhone 6" text:@"猜到猴哥玩手机时所思所想者，再奖iPhone一部。（奖品由“2014年野生动物摄影师”评委会颁发）" userId:3];
    [[StatusService shareStatusService] addStatus:status10];
}

-(void)removeUser{
    //注意在SQLite中区分大小写
    [[UserService shareUserService] removeUserByName:@"Yanyue"];
}

-(void)modifyUserInfo{
    User *user1= [[UserService shareUserService]getUserByName:@"Xiaona"];
    user1.city=@"上海";
    [[UserService shareUserService] modifyUser:user1];
    
    User *user2= [[UserService shareUserService]getUserByName:@"Lily"];
    user2.city=@"深圳";
    [[UserService shareUserService] modifyUser:user2];
}

#pragma mark 加载数据
-(void)loadStatusData{
    self.statusCells=[[NSMutableArray alloc]init];
    self.statuses=[[NSMutableArray alloc]initWithArray:[[StatusService shareStatusService]getAllStatus]];
    [self.statuses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        StatusTableViewCell *cell=[[StatusTableViewCell alloc]init];
        cell.status=(Status *)obj;
        [self.statusCells addObject:cell];
    }];
    NSLog(@"%@",[self.statuses lastObject]);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identtityKey=@"myTableViewCellIdentityKey1";
    StatusTableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:identtityKey];
    if(cell==nil){
        cell = [StatusTableViewCell cellWithTabelView:tableView];
       // cell=[[StatusTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identtityKey];
    }
    [cell initStatus:self.statuses[indexPath.row]];
   // cell.status=self.statuses[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[StatusService shareStatusService]removeStatus:self.statuses[indexPath.row]];
        [self.statuses removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert){
        NSLog(@"UITableViewCellEditingStyleInsert");
        NSArray *insertIndexPaths = [NSArray arrayWithObjects:indexPath,nil];
      //  [self.statuses insertObject:@"叽叽歪歪" atIndex:indexPath.row];
        Status *status1=[Status statusWithCreateAt:@"9:00" source:@"iPhone 6" text:[NSString stringWithFormat:@"添加的行 %d",indexPath.row+1] userId:1];
        [[StatusService shareStatusService] addStatus:status1];
        [self.statuses insertObject:status1 atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationMiddle];
    }
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isEdit) {
        return  UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;    
}
//
//- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
//- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

@end
