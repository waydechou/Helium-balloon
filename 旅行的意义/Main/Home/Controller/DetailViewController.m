//
//  DetailViewController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "DetailViewController.h"
#import "TopListViewController.h"
#import "PlansViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface DetailViewController ()

@property (copy, nonatomic) NSString *headImgUrl;
@property (strong, nonatomic) NSMutableDictionary *heightList;
@property (copy, nonatomic) NSMutableArray *cellKey;
@property (strong, nonatomic)UITableView *DetailTableView;
@property (strong, nonatomic) UIButton *button;

@property (strong, nonatomic) NSString *planName;
@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    [self _createUI];
    
    
//    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - 懒加载

- (DetailModel *)model {
    if (_model== nil) {
        _model = [[DetailModel alloc] init];
    }
    return _model;
}

- (NSMutableArray *)cellKey {
    if (_cellKey == nil) {
        _cellKey = [NSMutableArray array];
    }
    return _cellKey;
}

- (UITableView *)DetailTableView {
    if (_DetailTableView == nil) {
        _DetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _DetailTableView.backgroundColor = [UIColor clearColor];
        _DetailTableView.delegate = self;
        _DetailTableView.dataSource = self;
    }
    return _DetailTableView;
}


#pragma mark - 加载数据

- (void)_loadData {
    
    NSString *url = [NSString stringWithFormat:@"http://q.chanyouji.com/api/v2/destinations/%ld/detail.json",(long)_destination_id];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"获取成功");
        [self model].dataArray = responseObject[@"data"][@"sections"];
        
        _headImgUrl = responseObject[@"data"][@"destination"][@"photo_url"];
        NSURL *url = [NSURL URLWithString:_headImgUrl];
          _headImgView.frame = CGRectMake(0, 0, kScreenWidth, 220);
        [_headImgView sd_setImageWithURL:url];
        

        
        _titleLabel1.text = responseObject[@"data"][@"destination"][@"name_en"];
        _titleLabel2.text = responseObject[@"data"][@"destination"][@"name"];
        _titleView.frame = CGRectMake(0, 0, kScreenWidth, 220);
        _titleView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
      
        
 
        
        //读取单元格高度
        NSDictionary *cell = @{
                              @"Plan" : [NSString stringWithFormat:@"%f", [RailCell cellHeight]],
                              @"ActivityCollection" : [NSString stringWithFormat:@"%f", [ActivityCell cellHeight]],
                              @"UserActivity" : [NSString stringWithFormat:@"%f", [UserActivityCell cellHeight]],
                              @"Destination" : [NSString stringWithFormat:@"%f", [DestinationCell cellHeight]],
                              
                              };
        self.heightList = [[NSMutableDictionary alloc] initWithDictionary:cell];
        
        //读取单元格Type
        NSMutableArray *tempArr = [[self model].dataArray copy];
        for (NSDictionary *dic in tempArr) {
            [[self cellKey] addObject:dic[@"type"]];
        }
        
        //数据加载完成后加载tableView
        [self.view addSubview:[self DetailTableView]];
        
        //刷新
        [self.headImgView setNeedsDisplay];
        [self.DetailTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"获取失败");
        NSLog(@"%@", error);
        
    }];
    
}


#pragma mark - Table view data source

- (void)_createUI {
    
    [self.DetailTableView registerNib:[UINib nibWithNibName:@"RailCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Plan"];
    [self.DetailTableView registerNib:[UINib nibWithNibName: @"ActivityCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier: @"ActivityCollection"];
    [self.DetailTableView registerNib:[UINib nibWithNibName: @"UserActivityCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier: @"UserActivity"];
    [self.DetailTableView registerNib:[UINib nibWithNibName:@"DestinationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Destination"];

    //tableview头视图，背景设置clear，显示头背景图片
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _headImgView.height)];
    headView.backgroundColor = [UIColor clearColor];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(20, 20, 40, 40);
    [_button setImage:[UIImage imageNamed:@"button_icon_webback@2x"] forState:UIControlStateNormal];
    _headImgView.userInteractionEnabled = YES;
    _titleView.userInteractionEnabled = YES;
    [headView addSubview:_button];
    [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
//    headView.userInteractionEnabled = NO;
    _DetailTableView.tableHeaderView = headView;
  
    
    //将导航控制器显示
//    self.navigationController.navigationBarHidden = NO;
//    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _cellKey.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentitier = _cellKey[indexPath.row];
    
    if ([cellIdentitier isEqualToString:@"Plan"]) {
        
        RailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentitier forIndexPath:indexPath];
        
            if ([self model].dataArray != nil) {
                
                cell.baseModel = [BaseModel yy_modelWithDictionary:[self model].dataArray[indexPath.row]];
                _planName = cell.baseModel.models[0][@"title"];
                cell.delegate = self;
            }

        return cell;

    }else if ([cellIdentitier isEqualToString:@"ActivityCollection"]) {
        
        ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentitier forIndexPath:indexPath];
        

            if ([self model].dataArray != nil) {
                cell.baseModel = [BaseModel yy_modelWithDictionary:[self model].dataArray[indexPath.row]];
                
                cell.delegate = self;
                //如果只有一个榜单就把第二个榜单隐藏并调整单元格高度
                if (cell.baseModel.models.count == 1 ) {
                    
                    CGFloat cellHeight = 260;
                    
                    [_heightList setValue:[NSString stringWithFormat:@"%f", cellHeight] forKey:@"ActivityCollection"];
                    
                }
            }
        
            return cell;
        
    } else if ([cellIdentitier isEqualToString:@"UserActivity"]) {
        
        UserActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentitier forIndexPath:indexPath];
        
            if ([self model].dataArray != nil) {
                cell.baseModel = [BaseModel yy_modelWithDictionary:[self model].dataArray[indexPath.row]];            }
            
            return cell;
        
    } else if ([cellIdentitier isEqualToString:@"Destination"]) {
        
        DestinationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentitier forIndexPath:indexPath];
        
            if ([self model].dataArray != nil) {
                cell.baseModel = [BaseModel yy_modelWithDictionary:[self model].dataArray[indexPath.row]];
                
            }
            
            return cell;
        
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = _cellKey[indexPath.row];
    NSString *height = _heightList[str];
    
    
    return [height floatValue];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat offtop = scrollView.contentInset.top;
    CGRect headImgViewFrame = _headImgView.frame;
    CGRect titleViewFrame = _titleView.frame;
    
    if (titleViewFrame.origin.y >= 0 && offsetY < 0) {
        
        _button.hidden = YES;
        return;
    } else {
        _button.hidden = NO;
        
        _headImgView.top = -offsetY -offtop;
//        _headImgView.frame = headImgViewFrame;
        
        _titleView.top = -offsetY - offtop;
//        _titleView.frame = titleViewFrame;
    }
    
  
    
}

#pragma mark topListDelegate 方法实现

- (void)pushToTopListViewController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    
    TopListViewController *topListCtrl = [storyboard instantiateViewControllerWithIdentifier:@"TopListViewController"];
    topListCtrl.destination_id = self.destination_id;
    
    [self presentViewController:topListCtrl animated:YES completion:nil];
}

#pragma mark planDelegate

- (void)pushToPlanViewCtrlWithID:(NSInteger)count {
    
    PlansViewController *plansCtrl = [[PlansViewController alloc] init];
    plansCtrl.plan_ID = count;
    plansCtrl.planName = _planName;
    plansCtrl.iconUrl = self.photoUrl;
    UINavigationController *NV = [[UINavigationController alloc] initWithRootViewController:plansCtrl];
    
    [self presentViewController:NV animated:YES completion:nil];
    
}

#pragma mark -button
- (void)buttonAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

@end
