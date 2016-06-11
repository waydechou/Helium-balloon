//
//  TopListCollectionCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/31.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface TopListCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelTwo;
@property (strong, nonatomic)NSDictionary *dataDic;

@end
