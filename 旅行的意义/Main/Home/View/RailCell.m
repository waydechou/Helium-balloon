//
//  RailCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "RailCell.h"

#define kButtomSpacing 30
#define kButtonWidth 100
#define kButtonHeight 30

@interface RailCell()


@end

@implementation RailCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setBaseModel:(BaseModel *)baseModel {
    
    _baseModel = baseModel;
    
    for (NSDictionary *dic in _baseModel.models) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor colorWithRed:61.0/255 green:195.0/255 blue:255.0/255 alpha:1];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(kButtomSpacing, 68, kButtonWidth, kButtonHeight);
        [button setTitle:dic[@"title"] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [button addTarget:self action:@selector(railButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = [dic[@"id"] integerValue];
        [self.contentView addSubview:button];
        
    }
    
}

- (void)railButtonAction:(UIButton *)sender {
    
    for (NSDictionary *dic in _baseModel.models) {
        if (sender.tag == [dic[@"id"] integerValue]) {
            if ([self.delegate respondsToSelector:@selector(pushToPlanViewCtrlWithID:)]) {
                [self.delegate pushToPlanViewCtrlWithID:sender.tag];
            }
            
        }
    }
}

+ (CGFloat)cellHeight {
    
    
    return 110;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
