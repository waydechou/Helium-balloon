//
//  DownTableViewController.m
//  04-userManager
//
//  Created by Wayde C.  on 16/5/20.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "DownTableViewController.h"

@interface DownTableViewController ()

@end

@implementation DownTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabelView.sectionFooterHeight = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section  {
    return 10;
}


@end
