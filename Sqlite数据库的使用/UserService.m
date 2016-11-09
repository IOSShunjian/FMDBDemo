//
//  UserService.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "UserService.h"
#import "SqliteManager.h"
#import "User.h"

@implementation UserService
static UserService *shareUserService;

+(instancetype)shareUserService{
    if (shareUserService == nil) {
        shareUserService = [[UserService alloc]init];
    }
    return shareUserService;
}

-(void)addUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO User (name,screenName,profileImageUrl,mbtype,city) VALUES('%@','%@','%@','%@','%@')",user.name,user.screenName,user.profileImageUrl,user.mbtype,user.city];
    [[SqliteManager shareManager]excuteNonQuery:sql];
}
-(void)removeUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE Id = '%@'",user.Id];
    [[SqliteManager shareManager] excuteNonQuery:sql];
}
-(void)removeUserByName:(NSString *)name{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE name = '%@'",name];
    [[SqliteManager shareManager]excuteNonQuery:sql];

}

-(void)modifyUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"UPDATE User SET name = '%@',screenName = '%@',profileImageUrl = '%@',mbtype = '%@',city = '%@' WHERE Id = '%@'",user.name,user.screenName,user.profileImageUrl,user.mbtype,user.city,user.Id];
    [[SqliteManager shareManager] excuteNonQuery:sql];
}

-(User *)getUserById:(int)Id{
    User *user = [[User alloc]init];
    NSString *sql =[NSString stringWithFormat:@"SELECT name,screenName,profileImageUrl,mbtype,city FROM User WHERE Id = '%i'",Id];
    NSArray *rows = [[SqliteManager shareManager]excuteQuery:sql];
    if(rows && rows.count>0){
        [user setValuesForKeysWithDictionary:rows[0]];
        
    }
    return  user;
}
-(User *)getUserByName:(NSString *)name {
    User *user = [[User alloc]init];
    NSString *sql = [NSString stringWithFormat:@"SELECT Id,name,screenName,profileImageUrl,mbtype,city FROM User WHERE name = '%@'",name];
    NSArray *rows= [[SqliteManager shareManager] excuteQuery:sql];
    if (rows && rows.count>0) {
        [user setValuesForKeysWithDictionary:rows[0]];
    }
    return user;
}


@end
