//
//  UserActivityCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "UserActivityCell.h"

@implementation UserActivityCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setBaseModel:(BaseModel *)baseModel {
    
    _baseModel = baseModel;
    
    NSString *ImgUrl = baseModel.models[0][@"contents"][0][@"photo_url"];
    [_UserImgView sd_setImageWithURL:[NSURL URLWithString:ImgUrl]];
    
    _UserName.text = baseModel.models[0][@"user"][@"name"];
    
    _titleLabel.text = baseModel.models[0][@"topic"];
    
    _ActivityText.text = baseModel.models[0][@"description"];
    
    [_summary setTitle:baseModel.button_text forState:UIControlStateNormal];
    _summary.layer.borderColor = [[UIColor grayColor] CGColor];
    _summary.layer.borderWidth = 0.3f;
    _summary.layer.masksToBounds = YES;
    
    
}

+ (CGFloat)cellHeight {
    
    return 450;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
