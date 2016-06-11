//
//  PlanAnnotion.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "PlanModel.h"

@interface PlanAnnotion : NSObject<MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *subtitle;

@property(nonatomic, strong) PlanModel *planModel;

@end
