//
//  PlanModel.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/18.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlanModel : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *topic;

@property(nonatomic, copy) NSString *address;

@property(nonatomic, copy) NSString *photo_url;

@property(nonatomic, copy) NSString *introduce;

@property(nonatomic, assign) double lat;

@property(nonatomic, assign) double lng;

@property(nonatomic, assign) NSInteger position;

@end
