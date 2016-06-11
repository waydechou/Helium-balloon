//
//  LabelCollectionView.m
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/20.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "LabelCollectionView.h"

@implementation LabelCollectionView


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }
    
    self.delegate = self;
    self.dataSource = self;
}

- (void)setDataArray:(NSArray *)dataArray {
    
    _dataArray = dataArray;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifer = [NSString stringWithFormat:@"LabelCollectionViewCell"];
    
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.text = _dataArray[indexPath.row][@"name"];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.backgroundColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    
    [cell.contentView addSubview:label];
    
    return cell;
}


@end
