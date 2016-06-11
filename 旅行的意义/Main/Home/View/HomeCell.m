//
//  HomeCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"




@implementation HomeCell

- (UILabel *)titleLable {
    
    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLable];
    }
    
    return _titleLable;
}

- (NSMutableArray *)cityViewArr {
    
    if (_cityViewArr == nil) {
        
        _cityViewArr = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 2; i++) {
            
            for (NSInteger j = 0; j < 3; j++) {
                CityView *view = [[CityView alloc] initWithFrame:CGRectMake(j * (kItemsizeWidth + 10) + 10, i * (kItemsizeHeight + 5) + 50 + i * 10, kItemsizeWidth, kItemsizeHeight)];
                if (_modelArray.count != 0) {
                    view.model = self.modelArray[i * 3 + j];
                }
              
                [_cityViewArr addObject:view];
                
                [self.contentView addSubview:view];
            }
            

            
            
        }
        
    }
    
    return _cityViewArr;
}

- (UIButton *)moreButton {
    
    if (_moreButton == nil) {
        
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.frame = CGRectZero;
        _moreButton.titleLabel.textColor = [UIColor blackColor];
        
//        _moreButton.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:_moreButton];
    }
    
    return _moreButton;
}

- (void)setModelArray:(NSMutableArray *)modelArray {
    
    _modelArray = modelArray;
    
    self.titleLable.frame = CGRectMake(10, 20, kScreenWidth - 10, 20);
    

    [self cityViewArr];
    self.moreButton.frame = CGRectMake(0, 20 + 2 * kItemsizeHeight + 60, kScreenWidth, 30);
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(0, _moreButton.bottom + 5, kScreenWidth, 15)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:view];

}



@end
