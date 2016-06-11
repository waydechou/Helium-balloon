//
//  TravelNotesModel.h
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TravelNotesActivityModel.h"

@interface TravelNotesModel : NSObject

@property (nonatomic, copy)NSString *event_type;
@property (nonatomic, strong)NSDictionary *user;
@property (nonatomic, strong)TravelNotesActivityModel *activity;

@end
