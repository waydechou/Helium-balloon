//
//  HomeViewController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/16.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "HomeViewController.h"
#import "YYModel.h"
#import "DataService.h"
#import "HomeModel.h"
#import "HomeCell.h"
#import "UIImageView+WebCache.h"


//每个Cell之间的间隙
#define kSpaceSize (kScreenWidth - kItemWidth * kItemCount) / (kItemCount + 1)

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    NSMutableArray *DataArray; //数据
    NSMutableArray *DataArray2;
    NSMutableArray *DataArray3;
    UIView *headerView;  //头视图
    UIScrollView *headerScr; //头视图上得Scroll
//    UITableView *_tableView;
    UIPageControl *_pageCtr;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    
    [self loadData];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tag = 99;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.rowHeight = 20 + 2 * kItemsizeHeight + 120;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [_tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"Home"];

    //头视图的创建
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 220)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, kScreenWidth, 30)];
    view2.backgroundColor = [UIColor whiteColor];
    
    _tableView.tableHeaderView = view;
    
    //隐藏导航栏
    [self.view addSubview:_tableView];
    [self creatHeaderView];
}

#pragma -mark 头视图的搭建

- (void)creatHeaderView {
    
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 220)];
    headerView.userInteractionEnabled = YES;
    [self.view addSubview:headerView];
    
    headerScr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    headerScr.delegate = self;
    headerScr.tag = 88;
    headerScr.pagingEnabled = YES;
    headerScr.contentSize = CGSizeMake(4 * kScreenWidth, 180);
    [headerView addSubview:headerScr];
    
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    [img1 sd_setImageWithURL:[NSURL URLWithString:@"http://inspiration.chanyouji.cn/Advert/83/b0489137053e4b1a3c50c07e3ee63135.jpg"]];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, 180)];
    [img2 sd_setImageWithURL:[NSURL URLWithString:@"http://inspiration.chanyouji.cn/Advert/85/27d05ac182218d010c3f08ef945e726b.jpg"]];
    
    UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(2 * kScreenWidth, 0, kScreenWidth, 180)];
    [img3 sd_setImageWithURL:[NSURL URLWithString:@"http://inspiration.chanyouji.cn/Advert/84/e4952ab92ce4be5f68c69b4be26c6e09.jpg"]];
    
    UIImageView *img4 = [[UIImageView alloc] initWithFrame:CGRectMake(3 * kScreenWidth, 0, kScreenWidth, 180)];
    [img4 sd_setImageWithURL:[NSURL URLWithString:@"http://inspiration.chanyouji.cn/Advert/83/b0489137053e4b1a3c50c07e3ee63135.jpg"]];
    
    _pageCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 160, kScreenWidth, 20)];
    _pageCtr.numberOfPages = 3;
    
    
    //搜索框的创建
    UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 180, kScreenWidth, 40)];
    bar.placeholder = @"搜索目的地、游记";
    
    [headerScr addSubview:img1];
    [headerScr addSubview:img2];
    [headerScr addSubview:img3];
    [headerScr addSubview:img4];
    [headerView addSubview:_pageCtr];
    [headerView addSubview:bar];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollViewAction) userInfo:nil repeats:YES];
}

#pragma mark -scrollViewDelegete

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.tag == 88) {
       
        _pageCtr.currentPage =(scrollView.contentOffset.x > 2 * kScreenWidth) ? 0 : scrollView.contentOffset.x / kScreenWidth;
        
        if (scrollView.contentOffset.x > 3 * kScreenWidth) {
            
            scrollView.contentOffset = CGPointMake(0, 0);
        }
    }
    
    if (scrollView.tag == 99) {
        CGFloat ofy = scrollView.contentOffset.y;
        CGFloat top = scrollView.contentInset.top;
        
        if (ofy <= 0 ) {
            
        }
        else{
            
            headerView.top = -ofy - top ;
            
        }
    }
    
}

#pragma mark - timeAction

- (void)scrollViewAction {
    
    float x = headerScr.contentOffset.x;
    [UIView animateWithDuration:0.2 animations:^{
         headerScr.contentOffset = CGPointMake(x + kScreenWidth, 0);
    }];
    
    if (x == 2 * kScreenWidth) {
        
        [UIView animateWithDuration:0.2 animations:^{
            headerScr.contentOffset = CGPointMake(0, 0);
        }];
       
    }
  
   
  
    
}

#pragma -mark 结构的搭建

- (void)loadData {
     DataArray = [NSMutableArray array];

    [DataService requestWithURL:@"destinations/nearby.json?lat=30.32358509206055&lng=120.3522004637683" params:nil fileData:nil httpMethod:@"GET" success:^(NSURLSessionDataTask *task, id result) {
        NSArray *dataArray = result[@"data"];
       
        [dataArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HomeModel *model = [HomeModel yy_modelWithDictionary:obj];
            
            [DataArray addObject:model];
            if (idx == 5) {
               *stop = YES;
            }
            
            [_tableView reloadData];
            
        }];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    DataArray2 = [NSMutableArray array];
    [DataService requestWithURL:@"destinations/list.json?area=china" params:nil fileData:nil httpMethod:@"GET" success:^(NSURLSessionDataTask *task, id result) {
        NSArray *dataArray = result[@"data"];
        
        [dataArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HomeModel *model = [HomeModel yy_modelWithDictionary:obj];
            
            [DataArray2 addObject:model];
            if (idx == 5) {
                *stop = YES;
            }
            
            [_tableView reloadData];
            
        }];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    DataArray3 = [NSMutableArray array];
    
    [DataService requestWithURL:@"destinations/list.json?area=asia" params:nil fileData:nil httpMethod:@"GET" success:^(NSURLSessionDataTask *task, id result) {
        NSArray *dataArray = result[@"data"];
        
        [dataArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HomeModel *model = [HomeModel yy_modelWithDictionary:obj];
            
            [DataArray3 addObject:model];
            if (idx == 5) {
                *stop = YES;
            }
            
            [_tableView reloadData];
            
        }];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
    
}


#pragma -mark collectionViewdelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Home" forIndexPath:indexPath];

    if (indexPath.row == 0) {
        if (DataArray.count == 6) {
            cell.modelArray = DataArray;
        }
        cell.titleLable.text = @"附近目的地";
        [cell.moreButton setTitle:@"附近新鲜事" forState:UIControlStateNormal];
        [cell.moreButton setTitleColor:[UIColor colorWithRed:61.0/255.0 green:195.0/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
         [cell.moreButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    }

    if (indexPath.row == 1) {
        if (DataArray.count == 6) {
            cell.modelArray = DataArray2;
        }
        cell.titleLable.text = @"大陆热门目的地";
        [cell.moreButton setTitle:@"15省旅游攻略" forState:UIControlStateNormal];
        [cell.moreButton setTitleColor:[UIColor colorWithRed:61.0/255.0 green:195.0/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
         [cell.moreButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    }
    
    if (indexPath.row == 2) {
        if (DataArray.count == 6) {
            cell.modelArray = DataArray3;
        }
        cell.titleLable.text = @"亚洲热门目的地";
        [cell.moreButton setTitle:@"12国旅行攻略" forState:UIControlStateNormal];
        [cell.moreButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [cell.moreButton setTitleColor:[UIColor colorWithRed:61.0/255.0 green:195.0/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
    }
    
    return cell;
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
