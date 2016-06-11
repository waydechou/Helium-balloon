//
//  DestinationCell.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "DestinationCell.h"

@implementation DestinationCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DestinationCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"DesCollectionCell"];
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    

}

- (void)setBaseModel:(BaseModel *)baseModel {
    
    _baseModel = baseModel;
    
    _collectionView.contentSize = CGSizeMake(_baseModel.models.count * 80, 130);
    _collectionFlowLayout.itemSize = CGSizeMake(80, 130);
    _collectionFlowLayout.minimumInteritemSpacing = 20;
    
    [_summary setTitle:baseModel.button_text forState:UIControlStateNormal];
    _summary.layer.borderColor = [[UIColor grayColor] CGColor];
    _summary.layer.borderWidth = 0.3f;
    _summary.layer.masksToBounds = YES;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _baseModel.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DestinationCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"DesCollectionCell" forIndexPath:indexPath];
    
    cell.data = _baseModel.models[indexPath.row];
    
    return cell;
}

+ (CGFloat)cellHeight {
    
    return 240;
}

@end
