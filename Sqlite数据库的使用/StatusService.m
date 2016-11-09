//
//  StatusService.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "StatusService.h"
#import "SqliteManager.h"
#import "UserService.h"
@implementation StatusService
static StatusService *shareStatusService;
+(instancetype)shareStatusService{
    if (shareStatusService == nil) {
        shareStatusService = [[StatusService alloc]init];
    }
    return shareStatusService;
}

-(void)addStatus:(Status *)status{
    NSString *sql=[NSString stringWithFormat:@"INSERT INTO Status (source,createdAt,\"text\" ,user) VALUES('%@','%@','%@','%@')",status.source,status.createdAt,status.text,status.user.Id];
    [[SqliteManager shareManager ] excuteNonQuery:sql ];
}

-(void)removeStatus:(Status *)status{
    NSString *sql=[NSString stringWithFormat:@"DELETE FROM Status WHERE Id='%@'",status.Id];
    [[SqliteManager shareManager ] excuteNonQuery:sql ];
}

-(void)modifyStatus:(Status *)status{
    NSString *sql=[NSString stringWithFormat:@"UPDATE Status SET source='%@',createdAt='%@',\"text\"='%@' ,user='%@' WHERE Id='%@'",status.source,status.createdAt,status.text,status.user, status.Id];
    [[SqliteManager shareManager ] excuteNonQuery:sql ];
}

-(Status *)getStatusById:(int)Id{
    Status *status=[[Status alloc]init];
    NSString *sql=[NSString stringWithFormat:@"SELECT Id, source,createdAt,\"text\" ,user FROM Status WHERE Id='%i'", Id];
    NSArray *rows= [[SqliteManager shareManager ] excuteQuery:sql ];
    if (rows&&rows.count>0) {
        [status setValuesForKeysWithDictionary:rows[0]];
       // status.user=[[KCUserService sharedKCUserService] getUserById:[(NSNumber *)rows[0][@"user"] intValue]] ;
        status.user = [[UserService shareUserService] getUserById:[(NSNumber*)rows[0][@"user"] intValue]];
    }
    return status;
}

-(NSArray *)getAllStatus{
    NSMutableArray *array=[NSMutableArray array];
    NSString *sql=@"SELECT Id, source,createdAt,\"text\" ,user FROM Status ORDER BY Id";
    NSArray *rows= [[SqliteManager shareManager]excuteQuery:sql];
    for (NSDictionary *dic in rows) {
        Status *status=[self getStatusById:[(NSNumber *)dic[@"Id"] intValue]];
        [array addObject:status];
    }
    return array;
}
@end
