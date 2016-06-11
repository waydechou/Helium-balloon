//
//  DataService.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "DataService.h"
#import "AFNetworking.h"

#define BaseURL @"http://q.chanyouji.com/api/v2/"

@implementation DataService

+ (NSURLSessionDataTask *)requestWithURL:(NSString *)url params:(NSDictionary *)params fileData:(NSDictionary *)fileDic httpMethod:(NSString *)httpMethod success:(SuccessBlock)successBlcok failure:(FailureBlock)failBlock {
    
    url = [NSString stringWithFormat:@"%@%@", BaseURL, url];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    return [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        successBlcok(task, responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock(error);
    }];
    
    
}

@end
