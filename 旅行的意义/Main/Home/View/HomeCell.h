//
//  HomeCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityView.h"


#define kItemsizeWidth ((kScreenWidth - 40)/ 3 )
#define kItemsizeHeight (kScreenWidth / 3 )

@interface HomeCell : UITableViewCell 

@property (nonatomic, strong) UILabel *titleLable;

@property (nonatomic, strong) NSMutableArray *cityViewArr;

@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, strong) UIButton *moreButton;




@end
