//
//  CityView.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "CityView.h"
#import "UIImageView+WebCache.h"
#import "HomeViewController.h"
#import "RootTabBatController.h"

@implementation CityView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)]];
    }
    return self;
}

- (UIImageView *)cityimage {
    
    if (_cityimage == nil) {
        
        _cityimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (kScreenWidth - 40) / 3 , self.height - 40)];
        
        _cityimage.contentMode = UIViewContentModeScaleAspectFill;
        
        _cityimage.layer.cornerRadius = 5;
        
        _cityimage.clipsToBounds = YES;
        
        [self addSubview:_cityimage];
    }
    
    return _cityimage;
}

- (UILabel *)cityName {
    
    if (_cityName == nil) {
        
        _cityName = [[UILabel alloc] initWithFrame:CGRectMake(0, _cityimage.bottom + 5, _cityimage.width, 20)];
        
        _cityName.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_cityName];
        
    }
    
    return _cityName;
}


- (UILabel *)cityEnName {
    
    if (_cityEnName == nil) {
        
        _cityEnName = [[UILabel alloc] initWithFrame:CGRectMake(0, _cityName.bottom + 3, _cityimage.width, 20)];
        _cityEnName.textColor = [UIColor darkGrayColor];
        
        _cityEnName.font = [UIFont systemFontOfSize:14];
        _cityEnName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_cityEnName];
    }
    
    return _cityEnName;
    
}

- (void)setModel:(HomeModel *)model {

    _model = model;
    
    [self.cityimage sd_setImageWithURL:[NSURL URLWithString:_model.photo_url]];
    
    self.cityName.text = _model.name;
    
    self.cityEnName.text = _model.name_en;
}

#pragma mark - 点击跳转

- (void)tapView {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        
    DetailViewController *detailCtrl = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//
    detailCtrl.destination_id = [self.model.city_id integerValue];
    detailCtrl.photoUrl = self.model.photo_url;
//
//    RootTabBatController *rootCtrl = (RootTabBatController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    UINavigationController *nav = [rootCtrl.viewControllers firstObject];
//    
//    [nav pushViewController:detailCtrl animated:YES];
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[HomeViewController class]]) {
            HomeViewController *HomeVC = (HomeViewController *)responder;
            
            [HomeVC presentViewController:detailCtrl animated:YES completion:nil];
            
        }
        
        responder = responder.nextResponder;
    } while (responder != nil);
    
  
}


@end
