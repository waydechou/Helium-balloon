//
//  PlanMapView.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/20.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "PlanMapView.h"

@implementation PlanMapView



- (void)SetMapRegion:(CLLocationCoordinate2D)myCoordinate {
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);

    [self setRegion:MKCoordinateRegionMake(myCoordinate, span) animated:YES];
        self.centerCoordinate = myCoordinate;
    
}


- (void)setAnnotion:(PlanAnnotion *)annotion {
    
    
    [self addAnnotation:annotion];
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
