//
//  UserService.h
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface UserService : NSObject


+(instancetype)shareUserService;
/**
 *  添加用户信息
 *
 *  @param user 用户对象
 */
-(void)addUser:(User *)user;

/**
 *  删除用户
 *
 *  @param user 用户对象
 */
-(void)removeUser:(User *)user;

/**
 *  根据用户名删除用户
 *
 *  @param name 用户名
 */
-(void)removeUserByName:(NSString *)name;

/**
 *  修改用户内容
 *
 *  @param user 用户对象
 */
-(void)modifyUser:(User *)user;

/**
 *  根据用户编号取得用户
 *
 *  @param Id 用户编号
 *
 *  @return 用户对象
 */
-(User *)getUserById:(int)Id;

/**
 *  根据用户名取得用户
 *
 *  @param name 用户名
 *
 *  @return 用户对象
 */
-(User *)getUserByName:(NSString *)name;
@end
