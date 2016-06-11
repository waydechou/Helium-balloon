//
//  DestinationCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "DestinationCollectionCell.h"

@interface DestinationCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)BaseModel *baseModel;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionFlowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *summary;

+ (CGFloat)cellHeight;



@end
