//
//  PlanMapViewController.m
//  旅行的意义
//
//  Created by Wayde C.  on 16/5/19.
//  Copyright © 2016年 Wayde C. All rights reserved.
//

#import "PlanMapViewController.h"
#import "PlanButton.h"
#import "PlanAnnotationView.h"

@interface PlanMapViewController ()<MKMapViewDelegate>{
    
    NSMutableArray *annotionArray;
}

@end

@implementation PlanMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 10, 40, 40);
    [button setImage:[UIImage imageNamed:@"button_icon_webback@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self createMapView];
    [self createScrollView];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}
#pragma mark - 地图的创建
- (void)createMapView {
    
    _mapView = [[PlanMapView alloc] initWithFrame:self.view.bounds];
    
    _mapView.delegate = self;
    double lat = [_mapDic[@"lat"] doubleValue];
    double lng = [_mapDic[@"lng"] doubleValue];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lng);
    [_mapView SetMapRegion:coordinate];
    annotionArray = [NSMutableArray array];
    NSArray *arr = [_modelDic allKeys];
    int i = 0;
    for (int j = 0; j < arr.count; j++) {
        
        for (PlanModel *model in _modelDic[arr[j]]) {
            
            i++;
            PlanAnnotion *annotion = [[PlanAnnotion alloc] init];
            annotion.planModel = model;
            
            annotion.title = [NSString stringWithFormat:@"%@", model.name];
            [annotionArray addObject:annotion];
            [_mapView addAnnotation:annotion];
            
        }
    }
    
    
    [self.view addSubview:_mapView];
}

- (void)createScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 60, kScreenWidth, 60)];
    
    scrollView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    
//    scrollView.alpha = 0.6;
    
    NSArray *arry = [_modelDic allKeys];
    int j = 0;
    scrollView.contentSize = CGSizeMake(arry.count * kScreenWidth, 0);
    for (int i = 0; i < arry.count; i++) {
        
        
        CGFloat kitemSize = 50;
        
        for (PlanModel *model in _modelDic[arry[i]]) {
            
            PlanButton *button = [PlanButton buttonWithType:UIButtonTypeCustom];
            
            
            button.frame = CGRectMake(10 + j * (50 + 10)  , 5, kitemSize, kitemSize);
            button.backgroundColor = [UIColor whiteColor];
            UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kitemSize, kitemSize)];
            PlanAnnotion *annotion = [[PlanAnnotion alloc] init];
            annotion.planModel = model;
            button.annotion = annotion;
            button.tag = 1000 + j;
            button.layer.cornerRadius = 5.0f;
            [button addTarget:self action:@selector(mapButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            lable.text =[NSString stringWithFormat:@"%d.%@", j + 1, model.name];
            lable.numberOfLines = 0;
            lable.textColor = [UIColor blackColor];
            lable.font = [UIFont systemFontOfSize:12];
            lable.layer.cornerRadius = 5.0f;
            
            [button addSubview:lable];
            [scrollView addSubview:button];
            j++;
        }
    }
    scrollView.contentSize = CGSizeMake((j + 2 )* (50 + 10), 0);
    [self.view addSubview:scrollView];
}

- (void)buttonAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mapButtonAction:(PlanButton *)button {
    
    PlanModel *model = button.annotion.planModel;
    _mapView.centerCoordinate = CLLocationCoordinate2DMake(model.lat, model.lng);
    [_mapView selectAnnotation:annotionArray[button.tag - 1000] animated:YES];
}

#pragma mark - 地图的代理

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    
//    if ([annotation isKindOfClass:[MKUserLocation class]]) {
//        
//        return nil;
//    }
//    
//    static NSString *identity = @"annotation";
//    PlanAnnotationView *planView = (PlanAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identity];
//    if (planView == nil) {
//        
//        planView = [[PlanAnnotationView alloc] initWithAnnotation:(PlanAnnotion *)annotation reuseIdentifier:identity];
//        
//    }
//    
//    return planView;
//    
//}

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
