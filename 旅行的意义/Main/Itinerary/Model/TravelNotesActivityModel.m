//
//  TravelNotesActivityModel.m
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "TravelNotesActivityModel.h"

@implementation TravelNotesActivityModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{
             @"desc" : @"description"
             };
}

@end
