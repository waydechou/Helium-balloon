//
//  PlanAnnotion.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "PlanAnnotion.h"

@implementation PlanAnnotion

- (void)setPlanModel:(PlanModel *)planModel {
    
    _planModel = planModel;
    
    if (_planModel != nil) {
        
        self.coordinate = CLLocationCoordinate2DMake(_planModel.lat , _planModel.lng);
        self.title = planModel.name;
        self.subtitle =[NSString stringWithFormat:@"%li",planModel.position];
    }
}

@end
