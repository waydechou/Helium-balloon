//
//  DetailViewController.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RailCell.h"
#import "ActivityCell.h"
#import "UserActivityCell.h"
#import "DestinationCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "DetailModel.h"
#import "YYModel.h"

@interface DetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,topListDelegate,Plandelegate>

@property (weak, nonatomic) IBOutlet UIView *titleView;

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (strong, nonatomic) DetailModel *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (assign, nonatomic) NSInteger destination_id;

@property (assign, nonatomic) NSString *photoUrl;

@end
