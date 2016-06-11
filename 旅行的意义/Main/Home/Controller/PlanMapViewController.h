//
//  PlanMapViewController.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlanMapView.h"

@interface PlanMapViewController : UIViewController

@property(nonatomic, strong) PlanMapView *mapView;

@property(nonatomic, strong) NSMutableDictionary *mapDic;

@property(nonatomic, strong) NSMutableDictionary *modelDic;

@end
