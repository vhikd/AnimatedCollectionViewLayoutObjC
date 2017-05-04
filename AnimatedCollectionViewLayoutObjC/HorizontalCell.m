//
//  HorizontalCell.m
//  PageCollectionView
//
//  Created by 刁志远 on 2017/4/15.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "HorizontalCell.h"

@interface HorizontalCell () {
    
    UIImageView *ivShadow;
    
}

@end


@implementation HorizontalCell



#pragma mark - SYS

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    [self initinalContent];
//    [self addShadowImage];
    
    self.clipsToBounds = NO;
    
//     CGRect rect = CGRectMake(LeftSpacing, TopSpacing, [UIScreen mainScreen].bounds.size.width-LeftSpacing-RightSpacing, [UIScreen mainScreen].bounds.size.height-TopSpacing-BottomSpacing);
//    self.labContent.frame = rect;
}

#pragma mark - Public 

- (void)showShadow {
    
    if (ivShadow.hidden) {
        ivShadow.hidden = NO;
    }
}


- (void)hideShadow {
    
    if (!ivShadow.hidden) {
        ivShadow.hidden = YES;
    }
}


#pragma mark - UI





@end
