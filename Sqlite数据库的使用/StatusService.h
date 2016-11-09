//
//  StatusService.h
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"
@interface StatusService : NSObject

+(instancetype)shareStatusService;
/**
 *  添加微博信息
 *
 *  @param status 微博对象
 */
-(void)addStatus:(Status *)status;

/**
 *  删除微博
 *
 *  @param status 微博对象
 */
-(void)removeStatus:(Status *)status;

/**
 *  修改微博内容
 *
 *  @param status 微博对象
 */
-(void)modifyStatus:(Status *)status;

/**
 *  根据编号取得微博
 *
 *  @param Id 微博编号
 *
 *  @return 微博对象
 */
-(Status *)getStatusById:(int)Id;

/**
 *  取得所有微博对象
 *
 *  @return 所有微博对象
 */
-(NSArray *)getAllStatus;
@end
