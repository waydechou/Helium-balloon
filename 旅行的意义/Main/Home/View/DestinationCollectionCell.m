//
//  DestinationCollectionCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/17.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "DestinationCollectionCell.h"

@implementation DestinationCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    
    [_ImgView sd_setImageWithURL:[NSURL URLWithString:_data[@"photo_url"]]];
    _nameLabel.text = _data[@"name"];
    _summaryLabel.text = _data[@"summary"];
    
    
}

@end
