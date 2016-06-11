//
//  TravelNotesViewController.m
//  02-qingyouji
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "TravelNotesViewController.h"

@interface TravelNotesViewController ()

@property(nonatomic, strong)NSMutableArray *cellList;


@end

@implementation TravelNotesViewController


#pragma mark - 懒加载

- (NSMutableArray *)cellList {
    
    if (_cellList == nil) {
        _cellList = [NSMutableArray array];
    }
    return _cellList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"旅行游记";
    self.navigationController.navigationBar.translucent = NO;
    
    
    __weak TravelNotesViewController *weakTrlViewcontrl = self;
    
    [_TravelTableView addPullDownRefreshBlock:^{
        
        NSLog(@"下拉刷新");
        
        [weakTrlViewcontrl _loadNewCellData];
    }];
    
    [_TravelTableView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"上拉加载");
        
        [weakTrlViewcontrl _loadNextPageCellData];
    }];
    
    
    [self _loadData];
}


- (void)_loadData {
    
    NSString *url = @"http://q.chanyouji.com/api/v1/timelines.json";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSMutableArray *tempArr = [NSMutableArray array];
        
        NSArray *data = responseObject[@"data"];
        for (NSDictionary *dic in data) {
            
            TravelNotesModel *model = [TravelNotesModel yy_modelWithDictionary:dic];
            
            [tempArr addObject:model];
        }
        
        self.cellList = tempArr;
        
        //设置TableVIew数据源
        [self TravelTableView].cellList = self.cellList;
        [self.TravelTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"获取失败");
        NSLog(@"%@", error);
    }];
    
}

- (void)_loadNewCellData {
//    NSString *url = @"http://q.chanyouji.com/api/v1/timelines.json?interests=&page=1&per=50";
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        NSMutableArray *tempArr = [NSMutableArray array];
//        NSArray *data = responseObject[@"data"];
//        
//        for (NSDictionary *dic in data) {
//            
//            TravelNotesModel *downmModel = [TravelNotesModel yy_modelWithDictionary:dic];
//            
//            [tempArr addObject:downmModel
//             ];
//        }
//        for (int i = 0; i < 50; i++) {
//            
//            if (tempArr[i][@"activity"][@"id"]  == self.cellList[0][@"activity"][@"id"]) {
//                NSRange range = NSMakeRange(0, i);
//                NSArray *rangArr = [tempArr subarrayWithRange:range];
//                NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, i)];
//                [tempArr  insertObjects:rangArr atIndexes:set];
//                
//                self.cellList = tempArr;
//                [self TravelTableView].cellList = self.cellList;
//                [self.TravelTableView reloadData];
//                
//                break;
//            }
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        NSLog(@"下拉刷新失败");
//        NSLog(@"%@",error);
//    }];
    
    [self.TravelTableView.pullToRefreshView stopAnimating];
}

- (void)_loadNextPageCellData {
    
    NSString *url = @"http://q.chanyouji.com/api/v1/timelines.json?interests=&page=2&per=50";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
    NSMutableArray *tempArr = [NSMutableArray array];
    NSArray *data = responseObject[@"data"];
        
    for (NSDictionary *dic in data) {
            
        TravelNotesModel *model = [TravelNotesModel yy_modelWithDictionary:dic];
            
        [tempArr addObject:model];
    }
        [self.cellList addObjectsFromArray:tempArr];
        [self TravelTableView].cellList = self.cellList;
        [self.TravelTableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"上拉加载失败");
        NSLog(@"%@",error);
    }];
    
    [self.TravelTableView.infiniteScrollingView stopAnimating];
}


@end
