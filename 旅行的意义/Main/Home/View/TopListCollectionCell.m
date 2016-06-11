//
//  TopListCollectionCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/31.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "TopListCollectionCell.h"

@implementation TopListCollectionCell


- (void)setDataDic:(NSDictionary *)dataDic {
    _dataDic = dataDic;
    
    NSString *imgUrl = dataDic[@"photo_url"];
    NSString *name = dataDic[@"topic"];
    NSNumber *count = dataDic[@"inspiration_activities_count"] ;
    
    [_ImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    
    NSInteger number = [count intValue];
    _titleLabelOne.text = [NSString stringWithFormat:@"%ld条旅行灵感",(long)number];
    _titleLabelTwo.text = name;
    _titleView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
    
}

@end
