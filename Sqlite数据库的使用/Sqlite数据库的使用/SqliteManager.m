//
//  SqliteManager.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "SqliteManager.h"
//#import <sqlite3.h>
#import "FMDB.h"
#import "FMDatabase.h"
#define kDatabaseName @"myDatabase.db"
static SqliteManager *shareManager;
@implementation SqliteManager


//初始化manager
//打开数据库
//执行sql语句增删改
//执行查询语句，遍历行，列获取数据
//关闭数据库
//-(instancetype)init{
//    SqliteManager *manager;
//    if (self = [super init]) {
//        [manager openDb:kDatabaseName];
//    }
//    return manager;
//}
+(instancetype)shareManager{
    if (shareManager ==nil) {
       shareManager =  [[SqliteManager alloc]init];
        [shareManager openDb:kDatabaseName];
    }
    return shareManager;
}

-(void)openDb:(NSString*)daname{
    //先取得数据库的路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *databasePath = [path stringByAppendingString:daname];
    self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
//    if (![self.databaseQueue open]) {
//        NSLog(@"数据库打开失败");
//    }
//    else{
//        NSLog(@"数据库打开成功");
//    }
//    self.database = [FMDatabase databaseWithPath:databasePath];
//    //再打开或者创建打开数据库
////    if (SQLITE_OK != sqlite3_open([databasePath UTF8String], &self.database)) {
////        NSLog(@"数据库打开失败");
////    }
////    else{
////        NSLog(@"数据库打开成功");
////    }
//    if (![self.database open]) {
//        NSLog(@"数据库打开失败");
//    }
//    else{
//        NSLog(@"数据库打开成功");
//    }
    
}

-(void)excuteNonQuery:(NSString *)sql{
//    char *error;
//    if (SQLITE_OK != sqlite3_exec(_datebase, sql.UTF8String, NULL, NULL, &error)) {
//        NSLog(@"执行sql语句过程发生错误，错误信息：%s",error);
//    }
//    if (![self.database executeUpdate:sql]) {
//        NSLog(@"执行sql语句的过程中发生错误");
//    }
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:sql];
    }];
}
-(NSArray *)excuteQuery:(NSString *)sql {
    NSMutableArray *array = [NSMutableArray array];
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:sql];
        while (result.next) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            for (int i=0; i<result.columnCount; i++) {
                dic[[result columnNameForIndex:i]]  = [result stringForColumnIndex:i];
            }
            [array addObject:dic];
        }

    }];
            return array;
//    //先检查语法正确性
//    sqlite3_stmt *stmt;
//    if (SQLITE_OK == sqlite3_prepare_v2(_datebase, sql.UTF8String, -1, &stmt, NULL)) {
//        // 再单步执行sql语句
//        while (SQLITE_ROW == sqlite3_step(stmt)) {
//            int columnCount = sqlite3_column_count(stmt);
//            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//            for (int i=0; i<columnCount; i++) {
//                const char *name = sqlite3_column_name(stmt, i);
//                const unsigned char *value = sqlite3_column_text(stmt, i);
//                dic[[NSString stringWithUTF8String:name]] = [NSString stringWithUTF8String:(const char *)value];
//            }
//            [rows addObject:dic];
//        }
//    }
//    sqlite3_finalize(stmt);
//    return rows;
    //执行查询sql语句
//    FMResultSet *result = [self.database executeQuery:sql];
//    while (result.next) {
//        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//        for (int i=0; i<result.columnCount; i++) {
//            dic[[result columnNameForIndex:i]] = [result stringForColumnIndex:i];
//        }
//        [array addObject:dic];
//    }
//    return array;
}


@end
