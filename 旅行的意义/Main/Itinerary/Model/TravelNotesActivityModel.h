//
//  TravelNotesActivityModel.h
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TravelNotesActivityModel : NSObject

@property (nonatomic, retain)NSNumber *id;
@property (nonatomic, retain)NSNumber *contents_count;
@property (nonatomic, retain)NSNumber *comments_count;
@property (nonatomic, retain)NSNumber *favorites_count;
@property (nonatomic, copy)NSString *topic;
@property (nonatomic, copy)NSString *desc;
@property (nonatomic, strong)NSArray *contents;
@property (nonatomic, strong)NSDictionary *user;
@property (nonatomic, strong)NSArray *categories;


@end
