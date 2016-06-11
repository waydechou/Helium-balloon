//
//  TravelNotesCell.h
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelNotesModel.h"
#import "UIImageView+WebCache.h"
#import "LabelCollectionView.h"

@interface TravelNotesCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)TravelNotesModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *heamImgView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *largeImgView;
@property (weak, nonatomic) IBOutlet UILabel *textTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainTextLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *sImgViewCollection;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *sImgViewCollectionFlowlayout;
@property (weak, nonatomic) IBOutlet LabelCollectionView *labelCollectView;





@end
