//
//  UserManagerController.m
//  04-userManager
//
//  Created by Wayde C.  on 16/5/20.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "UserManagerController.h"

@interface UserManagerController ()

@end

@implementation UserManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blackView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
    self.UserHeadImgView.layer.cornerRadius = 40;
    self.UserHeadImgView.layer.masksToBounds = YES;
    self.sexImgView.layer.cornerRadius = 10;
    self.sexImgView.layer.masksToBounds = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
