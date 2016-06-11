//
//  ActivityCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "ActivityCell.h"

@interface  ActivityCell()

@end


@implementation ActivityCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setBaseModel:(BaseModel *)baseModel {
    
    _baseModel = baseModel;
    
    NSString *imgUrl1 = _baseModel.models[0][@"photo_url"];
    NSString *name1 = _baseModel.models[0][@"title"];
    NSString *summary1 = _baseModel.models[0][@"summary"];

    [_listOneImgView sd_setImageWithURL:[NSURL URLWithString:imgUrl1]];
    _titleView1LabelOne.text = summary1;
    _titleView1LabelTwo.text = name1;
    _titleView1.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
    
    if (_baseModel.models.count >= 2) {
            NSString *imgUrl2 = _baseModel.models[1][@"photo_url"];
            NSString *name2 = _baseModel.models[1][@"title"];
            NSString *summary2 = _baseModel.models[1][@"summary"];

            [_listTwoImgView sd_setImageWithURL:[NSURL URLWithString:imgUrl2]];
            _titleView2LabelOne.text = name2;
            _titleView2LabelTwo.text = summary2;
            _titleView2.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
    } else if(_baseModel.models.count == 1){
        
        _titleView2.hidden = YES;
        _listTwoImgView.hidden = YES;
    }
    
    
    [_summary setTitle:baseModel.button_text forState:UIControlStateNormal];
    _summary.layer.borderColor = [[UIColor grayColor] CGColor];
    _summary.layer.borderWidth = 0.3f;
    _summary.layer.masksToBounds = YES;

}
- (IBAction)summaryButtonAction:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(pushToTopListViewController)]) {
        [_delegate pushToTopListViewController];
    }
}

+ (CGFloat)cellHeight {

    return 400;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
