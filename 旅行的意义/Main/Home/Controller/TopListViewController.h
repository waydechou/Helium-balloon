//
//  TopListViewController.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/31.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface TopListViewController : UICollectionViewController

@property (strong, nonatomic) IBOutlet UICollectionView *topListCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *topListLayout;
@property (copy, nonatomic) NSString *url;
@property (assign, nonatomic) NSInteger destination_id;



@end
