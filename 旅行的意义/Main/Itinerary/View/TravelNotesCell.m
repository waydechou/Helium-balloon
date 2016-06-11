//
//  TravelNotesCell.m
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "TravelNotesCell.h"

#define kImgCollectCellCount  _model.activity.contents.count - 1

@implementation TravelNotesCell


- (void)awakeFromNib {
    
    _sImgViewCollection.delegate = self;
    self.sImgViewCollection.dataSource = self;
    
    self.heamImgView.layer.cornerRadius = 20;
    self.heamImgView.layer.masksToBounds = YES;
    
    if (_model == nil) {
        _model = [[TravelNotesModel alloc] init];
    }
    
}

- (void)setModel:(TravelNotesModel *)model {
    
    _model = model;
    
    self.UserNameLabel.text = model.user[@"name"];
    self.NameLabel.text = model.activity.user[@"name"];
    [self.heamImgView sd_setImageWithURL:model.activity.user[@"photo_url"]];
    [self.largeImgView sd_setImageWithURL:model.activity.contents[0][@"photo_url"]];
    self.textTitleLabel.text = model.activity.topic;
    self.mainTextLabel.text = model.activity.desc;
    
    //设置collection属性
    self.sImgViewCollection.contentSize = CGSizeMake(kImgCollectCellCount * 180, 120);
    self.sImgViewCollectionFlowlayout.itemSize = CGSizeMake(180, 120);
    self.sImgViewCollectionFlowlayout.minimumLineSpacing = 2;
    
    self.labelCollectView.dataArray = model.activity.categories;
    
    [self.labelCollectView reloadData];
    [self.sImgViewCollection reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _model.activity.contents.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     NSString *identifer = [NSString stringWithFormat:@"sImgCellID"];
    
    UICollectionViewCell *cell = [self.sImgViewCollection dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:cell.bounds];
    [img sd_setImageWithURL:self.model.activity.contents[indexPath.row + 1][@"photo_url"]];
    [cell.contentView addSubview:img];
    
    return cell;
}

@end
