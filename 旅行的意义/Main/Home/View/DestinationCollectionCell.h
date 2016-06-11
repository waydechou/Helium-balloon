//
//  DestinationCollectionCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/17.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "UIImageView+WebCache.h"

@interface DestinationCollectionCell : UICollectionViewCell

@property (nonatomic, strong) NSDictionary *data;
@property (weak, nonatomic) IBOutlet UIImageView *ImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@end
