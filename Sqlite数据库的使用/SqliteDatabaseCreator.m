//
//  SqliteDatabaseCreator.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "SqliteDatabaseCreator.h"
#import "SqliteManager.h"
@implementation SqliteDatabaseCreator
+(void)initDatabase{
    NSString *key = @"IsCreatedDb";
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    if ([[defaults valueForKey:key] intValue] != 1) {
        [self creatUsertable];
        [self creatStatusTable];
        [defaults setValue:@1 forKey:key];
    }
    
}

+(void)creatUsertable{
    NSString *sql = @"CREATE TABLE User(Id integer PRIMARY KEY AUTOINCREMENT,name text,screenName text,profileImageUrl text,mbtype text,city text)";
    [[SqliteManager shareManager] excuteNonQuery:sql];
    
}

+(void)creatStatusTable{
    NSString *sql= @"CREATE TABLE Status(Id integer PRIMARY KEY AUTOINCREMENT,source text,createdAt date,\"text\" text,user integer REFERENCES User (Id))";
    [[SqliteManager shareManager] excuteNonQuery:sql ];
}



@end
