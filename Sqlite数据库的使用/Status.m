//
//  Status.m
//  Sqlite数据库的使用
//
//  Created by BoDong on 2016/11/8.
//  Copyright © 2016年 Cloudream. All rights reserved.
//

#import "Status.h"

@implementation Status
-(Status *)initWithDictionary:(NSDictionary *)dic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
        self.user=[[User alloc]init];
        self.user.Id=dic[@"user"];
    }
    return self;
}

-(Status *)initWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text user:(User *)user{
    if (self=[super init]) {
        self.createdAt=createAt;
        self.source=source;
        self.text=text;
        self.user=user;
    }
    return self;
}

-(Status *)initWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text userId:(int)userId{
    if (self=[super init]) {
        self.createdAt=createAt;
        self.source=source;
        self.text=text;
        User *user=[[User alloc]init];
        user.Id=[NSNumber numberWithInt:userId];
        self.user=user;
    }
    return self;
}

-(NSString *)source{
    return [NSString stringWithFormat:@"来自 %@",_source];
}

+(Status *)statusWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text user:(User *)user{
    Status *status=[[Status alloc]initWithCreateAt:createAt source:source text:text user:user];
    return status;
}

+(Status *)statusWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text userId:(int)userId{
    Status *status=[[Status alloc]initWithCreateAt:createAt source:source text:text userId:userId];
    return status;
}
@end
