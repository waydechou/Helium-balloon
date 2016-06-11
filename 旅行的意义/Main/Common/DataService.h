//
//  DataService.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSURLSessionDataTask *task, id result);
typedef void(^FailureBlock)(NSError *error);

@interface DataService : NSObject

+ (NSURLSessionDataTask *)requestWithURL: (NSString *)url params: (NSDictionary *)params fileData:(NSDictionary *)fileDic httpMethod:(NSString *)httpMethod success:(SuccessBlock)successBlcok failure:(FailureBlock)failBlock;
@end
