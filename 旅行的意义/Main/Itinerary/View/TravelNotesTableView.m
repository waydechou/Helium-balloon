//
//  TravelNotesTableView.m
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "TravelNotesTableView.h"

@implementation TravelNotesTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
    
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.delegate = self;
    self.dataSource = self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _cellList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TravelNotesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TravelNotesCell" forIndexPath:indexPath];
    cell.model = [self cellList][indexPath.row];
    
    return cell;
}

@end
