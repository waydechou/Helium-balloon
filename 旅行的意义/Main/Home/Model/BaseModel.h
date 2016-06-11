//
//  RailCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic, assign)NSInteger count;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *button_text;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSArray *models;

@end
