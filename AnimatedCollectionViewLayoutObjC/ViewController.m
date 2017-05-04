//
//  ViewController.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "ViewController.h"

#import "HorizontalContent.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray *arrList;
}


@property (nonatomic, weak) UITableView *myTable;

@end

@implementation ViewController


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = arrList[indexPath.row];
    
    HorizontalContent *content = [[HorizontalContent alloc] initWithAnimateType:dic];
    [self.navigationController pushViewController:content animated:YES];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *sid = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sid];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:sid];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    NSDictionary *dic = arrList[indexPath.row];
    cell.textLabel.text = dic[@"name"];
    
    return cell;
}

#pragma mark - Build UI

- (void)buildTableView{
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                                      style:UITableViewStylePlain];
    
    self.myTable = table;
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    
    self.myTable.tableFooterView = [UIView new];
    
    [self.view addSubview:self.myTable];
}


#pragma mark - Initinal Data

- (void)initinalData {
    
    NSArray *arr = @[@{@"name":@"Parallax",@"class":@"ParallaxAttributesAnimator"},
                     @{@"name":@"ZoomInOut",@"class":@"ZoomInOutAttributesAnimator"},
                     @{@"name":@"RotateInOut",@"class":@"RotateInOutAttributesAnimator"},
                     @{@"name":@"Cards",@"class":@"LinearCardAttributesAnimator"},
                     @{@"name":@"CrossFade",@"class":@"CrossFadeAttributesAnimator"},
                     @{@"name":@"Cube",@"class":@"CubeAttributesAnimator"},
                     @{@"name":@"Page",@"class":@"PageAttributesAnimator"},
                     @{@"name":@"Move In",@"class":@"PageMoveOut"},
                     @{@"name":@"Move Out",@"class":@"PageMoveIn"},
                     @{@"name":@"no animateion"}];
    
    arrList = [NSMutableArray arrayWithArray:arr];
}

#pragma mark - SYS

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"AnimatedCollectionViewLayoutObjC";
    [self initinalData];
    [self buildTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
