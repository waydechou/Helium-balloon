//
//  TravelNotesTableView.h
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelNotesCell.h"

@interface TravelNotesTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSMutableArray *cellList;

@end
