//
//  User.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "User.h"

@implementation User
-(User *)initWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city{
    if (self=[super init]) {
        self.name=name;
        self.screenName=screenName;
        self.profileImageUrl=profileImageUrl;
        self.mbtype=mbtype;
        self.city=city;
    }
    return self;
}


-(User *)initWithDictionary:(NSDictionary *)dic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(User *)userWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city{
    User *user=[[User alloc]initWithName:name screenName:screenName profileImageUrl:profileImageUrl mbtype:mbtype city:city];
    return user;
}
@end
