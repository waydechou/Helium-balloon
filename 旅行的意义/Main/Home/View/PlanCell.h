//
//  PlanCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/18.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlanModel.h"

@interface PlanCell : UITableViewCell

@property(nonatomic, strong) UIImageView *homeImg;

@property(nonatomic, strong) UILabel *titleLable;

@property(nonatomic, strong) UILabel *addressLable;

@property(nonatomic, strong) UIImageView *imgView;

@property(nonatomic, strong) UILabel *desLable;

@property(nonatomic, strong) PlanModel *model;

@end
