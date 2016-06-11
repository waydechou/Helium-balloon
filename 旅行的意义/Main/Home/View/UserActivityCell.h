//
//  UserActivityCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "UIImageView+WebCache.h"

@interface UserActivityCell : UITableViewCell

@property (nonatomic, strong)BaseModel *baseModel;
@property (weak, nonatomic) IBOutlet UIImageView *UserImgView;
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *ActivityText;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *summary;

+ (CGFloat)cellHeight;


@end
