//
//  ActivityCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "UIImageView+WebCache.h"

@protocol topListDelegate <NSObject>

- (void)pushToTopListViewController;

@end


@interface ActivityCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *listOneImgView;
@property (weak, nonatomic) IBOutlet UIImageView *listTwoImgView;
@property (nonatomic, strong)BaseModel *baseModel;
@property (weak, nonatomic) IBOutlet UIView *titleView2;
@property (weak, nonatomic) IBOutlet UIView *titleView1;
@property (weak, nonatomic) IBOutlet UILabel *titleView1LabelOne;
@property (weak, nonatomic) IBOutlet UILabel *titleView1LabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *titleView2LabelOne;
@property (weak, nonatomic) IBOutlet UILabel *titleView2LabelTwo;
@property (weak, nonatomic) IBOutlet UIButton *summary;
@property (assign, nonatomic) CGFloat cellHeight;

@property (assign, nonatomic)id <topListDelegate> delegate;

+ (CGFloat)cellHeight;


@end
