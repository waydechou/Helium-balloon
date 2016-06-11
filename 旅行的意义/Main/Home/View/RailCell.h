//
//  RailCell.h
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

@protocol Plandelegate <NSObject>

- (void)pushToPlanViewCtrlWithID:(NSInteger)count;

@end

@interface RailCell : UITableViewCell

@property (nonatomic, strong) BaseModel *baseModel;

@property (nonatomic, assign) id<Plandelegate> delegate;

+ (CGFloat)cellHeight;

@end
