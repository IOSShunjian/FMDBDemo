//
//  User.h
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
#pragma mark 编号
@property (nonatomic,strong) NSNumber *Id;

#pragma mark 用户名
@property (nonatomic,copy) NSString *name;

#pragma mark 用户昵称
@property (nonatomic,copy) NSString *screenName;

#pragma mark 头像
@property (nonatomic,copy) NSString *profileImageUrl;

#pragma mark 会员类型
@property (nonatomic,copy) NSString *mbtype;

#pragma mark 城市
@property (nonatomic,copy) NSString *city;

#pragma mark - 动态方法

/**
 *  初始化用户
 *
 *  @param name 用户名
 *  @param city 所在城市
 *
 *  @return 用户对象
 */
-(User *)initWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city;

/**
 *  使用字典初始化用户对象
 *
 *  @param dic 用户数据
 *
 *  @return 用户对象
 */
-(User *)initWithDictionary:(NSDictionary *)dic;

#pragma mark - 静态方法
+(User *)userWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city;
@end
