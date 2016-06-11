//
//  NoteCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/23.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "NoteCell.h"

@implementation NoteCell

- (UILabel *)titleLable {
    
    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, kScreenWidth - 60, 40)];
        _titleLable.numberOfLines = 0;
        _titleLable.font = [UIFont systemFontOfSize:18];
        
        [self addSubview:_titleLable];
    }
    return _titleLable;
}

- (UIImageView *)icon {
    
    if (_icon == nil) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
       _icon.contentMode = UIViewContentModeScaleAspectFill;
        
        _icon.layer.cornerRadius = 2;
        
        _icon.clipsToBounds = YES;
        
        [self addSubview:_icon];
    }
    
    return _icon;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
