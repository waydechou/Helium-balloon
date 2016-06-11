//
//  CityView.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "DetailViewController.h"

@protocol CityViewDelegate <NSObject>

- (void)pushToDetailWithID:(NSString *)city_id;

@end

@interface CityView : UIView

@property (nonatomic, strong) UIImageView *cityimage;

@property (nonatomic, strong) UILabel *cityName;

@property (nonatomic, strong) UILabel *cityEnName;

@property (nonatomic, strong) HomeModel *model;

@property (nonatomic, assign) id<CityViewDelegate> delegate;

@end
