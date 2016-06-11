//
//  RootTabBatController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "RootTabBatController.h"

@interface RootTabBatController (){
    
    UIImageView *_selectView;
    
}

@end

@implementation RootTabBatController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self removeSubviews];
    
    
    
    [self createViewCtrls];
    [self createTabBar];
}

- (void)createViewCtrls {
    
    NSArray *storyboardNames = @[@"Home", @"TravelNotes", @"Note", @"UserManager"];
    
    NSMutableArray *viewCtrls = [NSMutableArray arrayWithCapacity:storyboardNames.count];
    for (int i = 0; i < storyboardNames.count; i++) {
        
        NSString *storyboardName = storyboardNames[i];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
        UIViewController *viewCtrl = [storyboard instantiateInitialViewController];
        [viewCtrls addObject:viewCtrl];
        
    }
    
    self.viewControllers = viewCtrls;

}


- (void)createTabBar {
    
    float itemSize = kScreenWidth / 4;
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2, itemSize, 45)];
    _selectView.image = [UIImage imageNamed:@"home_bottom_tab_arrow@2x.png"];
    [self.tabBar addSubview:_selectView];
    
    NSArray *imgArr = @[
                        @"home_tab_icon_1@2x",
                        @"home_tab_icon_3@2x",
                        @"home_tab_icon_4@2x",
                        @"home_tab_icon_5@2x"
                        ];
    
    for (int i = 0; i < imgArr.count; i++ ) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * itemSize, 2, itemSize, 45)];
        [button setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        
        [self.tabBar addSubview:button];
        
    }
    
    self.tabBar.backgroundColor = [UIColor grayColor];
    
    
}

- (void)selected:(UIButton *)sender {
    
    self.selectedIndex = sender.tag - 100;
    
    [UIView animateWithDuration:0.1 animations:^{
        _selectView.center = sender.center;
    }];
}


- (void)removeSubviews {
    
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
