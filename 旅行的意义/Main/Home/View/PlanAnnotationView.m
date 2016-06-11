//
//  PlanAnnotationView.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/20.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "PlanAnnotationView.h"
#import "PlanAnnotion.h"

@implementation PlanAnnotationView


- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        
        [self _creatSubviews];
    }
    
    return self;
}

- (void)_creatSubviews {
    
    UILabel *positionLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    PlanAnnotion *annotation = self.annotation;
    positionLable.backgroundColor = [UIColor greenColor];
    
    positionLable.text = annotation.subtitle;
    positionLable.layer.cornerRadius = 10.0f;
    
    
    [self addSubview:positionLable];
    
}

@end
