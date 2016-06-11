//
//  PlanCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/18.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "PlanCell.h"
#import "UIImageView+WebCache.h"

@implementation PlanCell


- (UIImageView *)homeImg {
    
    if (_homeImg == nil) {
        _homeImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        
 
        [self.contentView addSubview:_homeImg];
    }
    
    return _homeImg;
}

- (UILabel *)titleLable {
    
    if (_titleLable == nil ) {
        
        _titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_titleLable];
    }
    
    return _titleLable;
    
}

- (UILabel *)addressLable {
    
    if (_addressLable == nil) {
        
        _addressLable = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_addressLable];
    }
    
    return _addressLable;
}

- (UIImageView *)imgView {
    
    if(_imgView == nil) {
        
        _imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_imgView];
    }
    
    return _imgView;
}

- (UILabel *)desLable {
    
    if (_desLable == nil) {
        _desLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _desLable.numberOfLines = 0;
        
        [self.contentView addSubview:_desLable];
    }
    
    return _desLable;
}

- (void)setModel:(PlanModel *)model {
    
    _model = model;
    
    
    self.homeImg.frame = CGRectMake(0, 10, 40, 30);
    self.homeImg.image = [UIImage imageNamed:@"home.png"];
    self.titleLable.frame = CGRectMake(50, 0, kScreenWidth, 30);
    self.titleLable.text = _model.topic;
    
    self.addressLable.frame = CGRectMake(50, self.titleLable.bottom, kScreenWidth, 20);
    self.addressLable.text = _model.address;
    self.addressLable.font = [UIFont systemFontOfSize:14];
    self.addressLable.textColor = [UIColor lightGrayColor];
    
//    self.imgView.frame = CGRectMake(0, self.addressLable.bottom, kScreenWidth, 150);
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_model.photo_url]];
    
    self.desLable.text = _model.introduce;

//    self.desLable.frame = CGRectMake(0, self.imgView.bottom, kScreenWidth, desRect.size.height + 50);
    
    
   
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
