//
//  TravelNotesViewController.h
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelNotesModel.h"
#import "YYModel.h"
#import "AFNetworking.h"
#import "WXRefresh.h"
#import "TravelNotesTableView.h"

@interface TravelNotesViewController : UITableViewController
@property (strong, nonatomic) IBOutlet TravelNotesTableView *TravelTableView;


@end
