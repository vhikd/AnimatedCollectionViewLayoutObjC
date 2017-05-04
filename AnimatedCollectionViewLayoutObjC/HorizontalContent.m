//
//  HorizontalContent.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "HorizontalContent.h"

#import "HorizontalFlowLayout.h"
#import "HorizontalCell.h"

@interface HorizontalContent () <UICollectionViewDelegate, UICollectionViewDataSource>{
    
    NSDictionary *dicType;
    
}

@property (nonatomic, weak) UICollectionView *myCollect;

@end

@implementation HorizontalContent


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    HorizontalCell *hcell = (HorizontalCell *)cell;
    
    hcell.labTitle.text = @"";
    hcell.labPage.text = @"";
    
    hcell.labContent.text = [NSString stringWithFormat:@"Page %03d",indexPath.row];
    
    
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    [hcell setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 100;
    
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HorizontalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PageCell"
                                                                     forIndexPath:indexPath];
    
    
    
    return cell;
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
    //    return [[dicChapters allKeys] count];
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



#pragma mark - Build UI

- (void)buildContentView {
    
    
    HorizontalFlowLayout *lay = [HorizontalFlowLayout new];
    lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    lay.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    lay.minimumLineSpacing = 0;
    lay.minimumInteritemSpacing = 0;
    
    if (dicType[@"class"]) {
        Class cls = NSClassFromString(dicType[@"class"]);
        lay.animator = [cls new];
        lay.shouldReLayout = YES;
    }
    else {
        lay.animator = nil;
        lay.shouldReLayout = NO;
    }
    
    
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:lay];
    [collect registerNib:[UINib nibWithNibName:@"HorizontalCell"
                                        bundle:nil]
forCellWithReuseIdentifier:@"PageCell"];
    collect.pagingEnabled = YES;
    collect.delegate = self;
    collect.dataSource = self;
    collect.backgroundColor = [UIColor clearColor];
    collect.decelerationRate = UIScrollViewDecelerationRateFast;
    collect.showsHorizontalScrollIndicator = NO;
    collect.bounces = NO;
    [self.view addSubview:collect];
    
    self.myCollect = collect;
    
}


#pragma mark - SYS

- (instancetype)initWithAnimateType:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        dicType = [NSDictionary dictionaryWithDictionary:dic];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = dicType[@"name"];
    [self buildContentView];
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
