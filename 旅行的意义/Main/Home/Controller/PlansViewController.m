//
//  PlansViewController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/18.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "PlansViewController.h"
#import "PlanCell.h"
#import "DataService.h"
#import "PlanAnnotion.h"
#import "PlanMapView.h"
#import "PlanMapViewController.h"

#import "YYModel.h"

@interface PlansViewController ()<UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate>{
    
    UITableView *_tableView;
    NSMutableArray *dataArr;
//    NSMutableArray *modelArr;
    NSMutableDictionary *modelDic;
    BOOL isExpand[100][100];
    NSMutableDictionary *cellHeightList;
    NSMutableDictionary *mapDic;
    NSMutableArray *VCArr;
    PlanMapView *_mapView;
}

@end

@implementation PlansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.planName;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView.backgroundColor = [UIColor whiteColor];
    _mapView.delegate = self;
//    _tableView.rowHeight = 400;
    
    [_tableView registerClass:[PlanCell class] forCellReuseIdentifier:@"PlanCell"];
    dataArr = [NSMutableArray array];
    cellHeightList = [NSMutableDictionary dictionary];
    mapDic = [NSMutableDictionary dictionary];

    [self loadData];
    
    [self.view addSubview:_tableView];
    
    UIButton *copyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    copyButton.frame = CGRectMake(0, kScreenHeight - 40, kScreenWidth, 40);
    copyButton.backgroundColor = [UIColor colorWithRed:61.0/255.0 green:195.0/255.0 blue:1 alpha:1];
    [copyButton setTitle:@"复制这条行程" forState:UIControlStateNormal];
    [copyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [copyButton addTarget:self action:@selector(copyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 10, 40, 40);
    [button setImage:[UIImage imageNamed:@"button_icon_webback@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [self.view addSubview:copyButton];
}

#pragma mark -加载数据
- (void)loadData {
    NSString *url = [NSString stringWithFormat:@"plans/%ld.json", _plan_ID];
    
    [DataService requestWithURL:url params:nil fileData:nil httpMethod:@"GET" success:^(NSURLSessionDataTask *task, id result) {
        
        dataArr = result[@"data"][@"days"];
        mapDic = result[@"data"][@"destination"];
        modelDic  = [NSMutableDictionary dictionary];
        
        int i = 0;
        int j = 0;
        for (NSDictionary *dic in dataArr) {
            
            NSArray *arr = dic[@"points"];
            NSMutableArray *modelArr = [NSMutableArray array];
            for (NSDictionary *planDic in arr) {
                j++;
                PlanModel *model = [[PlanModel alloc] init];
                model.name = planDic[@"poi"][@"name"];
                model.topic = planDic[@"inspiration_activity"][@"topic"];
                model.address = planDic[@"inspiration_activity"][@"address"];
                model.photo_url = planDic[@"inspiration_activity"][@"photo"][@"photo_url"];
                model.introduce = planDic[@"inspiration_activity"][@"introduce"];
                model.lat = [planDic[@"poi"][@"lat"] doubleValue];
                model.lng = [planDic[@"poi"][@"lng"] doubleValue];
                model.position = j;
                [modelArr addObject:model];
            }
            
            [modelDic setObject:modelArr forKey:@(i)];
            
            
            i++;
        }
        
        [_tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark -tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowArr = dataArr[section][@"points"];
    return rowArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlanCell" forIndexPath:indexPath];
    PlanModel *model = [modelDic objectForKey:@(indexPath.section)][indexPath.row];
    cell.model = model;
   
    if (isExpand[indexPath.section][indexPath.row]) {
        cell.imgView.frame = CGRectMake(0, cell.addressLable.bottom + 10, kScreenWidth, 200);
        CGRect desRect = [model.introduce boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16]} context:NULL];
        cell.desLable.frame = CGRectMake(10, cell.imgView.bottom + 10, kScreenWidth - 20, desRect.size.height + 40);
    }else {
        cell.imgView.frame = CGRectZero;
        cell.desLable.frame = CGRectZero;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    isExpand[indexPath.section][indexPath.row] = !isExpand[indexPath.section][indexPath.row];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationFade];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (isExpand[indexPath.section][indexPath.row]) {
        PlanModel *model = [modelDic objectForKey:@(indexPath.section)][indexPath.row];
        CGRect desRect = [model.introduce boundingRectWithSize:CGSizeMake(kScreenWidth -20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16]} context:NULL];
        return desRect.size.height + 200 + 120 ;
    }
    return 60;
}
#pragma mark -头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
        //地图的处理
        _mapView = [[PlanMapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        
        double lat = [mapDic[@"lat"] doubleValue];
        double lng = [mapDic[@"lng"] doubleValue];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lng);
        [_mapView SetMapRegion:coordinate];
        _mapView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction)];
        [_mapView addGestureRecognizer:gesture];
        int i = 0;
        
        NSArray *arr = [modelDic allKeys];
        
        for (int j = 0; j < arr.count; j++) {
            
            for (PlanModel *model in modelDic[arr[j]]) {
                
                i++;
                PlanAnnotion *annotion = [[PlanAnnotion alloc] init];
                annotion.planModel = model;
                
                annotion.title = [NSString stringWithFormat:@"%d", i];
                annotion.subtitle = [NSString stringWithFormat:@"%d", i];

                [_mapView addAnnotation:annotion];
             
            }
        }

    }else {
        _mapView.frame = CGRectZero;
    }
    UILabel *dayLable = [[UILabel alloc] initWithFrame:CGRectMake(0, _mapView.bottom, kScreenWidth, 40)];
    dayLable.text = [NSString stringWithFormat:@"DAY%li", section + 1];
    dayLable.textAlignment = NSTextAlignmentCenter;
    dayLable.backgroundColor = [UIColor whiteColor];

    CGRect desRect = [dataArr[section][@"description"] boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16]} context:NULL];
    
    UILabel *desLable = [[UILabel alloc] initWithFrame:CGRectMake(10, dayLable.bottom + 10, kScreenWidth - 20, desRect.size.height + 35)];
    desLable.numberOfLines = 0;
    desLable.backgroundColor = [UIColor whiteColor];
  
    desLable.text = dataArr[section][@"description"];
    UIView *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
//    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    
    [view addSubview:dayLable];
    [view addSubview:desLable];
    [view addSubview:_mapView];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
 
    CGRect desRect = [dataArr[section][@"description"] boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16]} context:NULL];
    
    if (section == 0) {
        return desRect.size.height + 300;
    }
    return desRect.size.height + 90;
}


- (void)gestureAction {
    
    PlanMapViewController *VC = [[PlanMapViewController alloc] init];
    VC.mapDic = mapDic;
    VC.modelDic = modelDic;
    
    [self presentViewController:VC animated:YES completion:nil];
}


- (void)buttonAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)copyButtonAction {
    
    
    NSDictionary *planDic = [NSDictionary dictionaryWithObjectsAndKeys:
                             @(_plan_ID), @"ID",
                             _planName, @"planName",
                             _iconUrl, @"icon",
                             nil];
    NSString *key = _planName;
    [[NSUserDefaults standardUserDefaults] setObject:planDic forKey:key];
    

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
