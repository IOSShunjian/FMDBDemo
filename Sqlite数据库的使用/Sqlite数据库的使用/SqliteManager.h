//
//  SqliteManager.h
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
@interface SqliteManager : NSObject

//@property(nonatomic)FMDatabase  *database;
@property(nonatomic)FMDatabaseQueue *databaseQueue;
+(instancetype)shareManager;
-(void)openDb:(NSString*)daname;
-(void)excuteNonQuery:(NSString *)sql;
-(NSArray *)excuteQuery:(NSString *)sql;


@end
