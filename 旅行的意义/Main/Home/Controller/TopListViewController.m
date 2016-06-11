//
//  TopListViewController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/31.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "TopListViewController.h"
#import "TopListCollectionCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width


@interface TopListViewController ()

@property (copy, nonatomic) NSMutableArray *dataArray;

@end

@implementation TopListViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - 懒加载

- (NSMutableArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    
    _topListLayout.itemSize = CGSizeMake(kScreenWidth - 20, 160);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 10, 40, 40);
    [button setImage:[UIImage imageNamed:@"button_icon_webback@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)_loadData {
    

    NSString *url = [NSString stringWithFormat:@"http://q.chanyouji.com/api/v1/activity_collections.json?destination_id=%ld",(long)_destination_id];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        for (NSDictionary *dic in responseObject[@"data"]) {
            [[self dataArray] addObject:dic];
        }
        
        [_topListCollectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopListCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"TopLIstCollectionCell" forIndexPath:indexPath];
    
    if (_dataArray != nil) {
        NSDictionary *dic = _dataArray[indexPath.row];
        
        cell.dataDic = dic;
    }
    
    return cell;
}

- (void)buttonAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
