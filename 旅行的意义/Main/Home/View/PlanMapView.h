//
//  PlanMapView.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/20.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "PlanAnnotion.h"

@interface PlanMapView : MKMapView



- (void)SetMapRegion:(CLLocationCoordinate2D)myCoordinate;

- (void)setAnnotion:(PlanAnnotion *)annotion;

@end
