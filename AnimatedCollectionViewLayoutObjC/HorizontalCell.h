//
//  HorizontalCell.h
//  PageCollectionView
//
//  Created by 刁志远 on 2017/4/15.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,ShadowOri) {
    SHADOW_LEFT,
    SHADOW_RIGHT,
};

@interface HorizontalCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labPage;
@property (weak, nonatomic) IBOutlet UIImageView *ivBk;
@property (weak, nonatomic) IBOutlet UILabel *labContent;


@end
