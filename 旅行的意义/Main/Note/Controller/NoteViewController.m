//
//  NoteViewController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "NoteViewController.h"
#import "NoteCell.h"
#import "PlansViewController.h"
#import "UIImageView+WebCache.h"

@interface NoteViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tabView;

@property (nonatomic, strong) NSMutableDictionary *planDic;

@property (nonatomic, strong) NSMutableArray *keyArray;

@property (nonatomic, assign) BOOL Flag;
@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [_tabView registerClass:[NoteCell class] forCellReuseIdentifier:@"NoteCell"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 30);
    [button setTitle:@"刷新" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 5;
    button.backgroundColor = [UIColor colorWithRed:50/255.0 green:170/255.0 blue:0.9 alpha:1];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(0, 0, 40, 30);
    [button2 setTitle:@"编辑" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:170.0/255.0 blue:0.9 alpha:1];
    button2.layer.cornerRadius = 5;
     button2.titleLabel.font = [UIFont systemFontOfSize:16];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button2];

    // Do any additional setup after loading the view.
}

- (void)loadData {
    
    NSString *filepath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.CL.HDU.-----.plist"];
    
    _planDic = [NSMutableDictionary dictionaryWithContentsOfFile:filepath];
    NSLog(@"%@", _planDic);
//    _keyArray = [_planDic allKeys];
    [_tabView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [_planDic allKeys].count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NoteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
    
    

    cell.titleLable.text = _planDic[[_planDic allKeys][indexPath.row]][@"planName"];
   
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:_planDic[[_planDic allKeys][indexPath.row]][@"icon"]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PlansViewController *PVC = [[PlansViewController alloc] init];
    PVC.plan_ID = [_planDic[[_planDic allKeys][indexPath.row]][@"ID"] integerValue];
    UINavigationController *NA = [[UINavigationController alloc] initWithRootViewController:PVC];
    PVC.planName = _planDic[[_planDic allKeys][indexPath.row]][@"planName"];
    [self presentViewController:NA animated:YES completion:nil];
    
}


- (void)change{
    
    _Flag = !_Flag;
    if (_Flag) {
        [_tabView setEditing:YES animated:YES];
        
    }
    else{
        
        [_tabView setEditing:NO animated:YES];
    }
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_tabView beginUpdates];
         [[NSUserDefaults standardUserDefaults] removeObjectForKey:[_planDic allKeys][indexPath.row]];
        [_planDic removeObjectForKey:[_planDic allKeys][indexPath.row]];
        [_tabView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
       

        [_tabView endUpdates];
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
