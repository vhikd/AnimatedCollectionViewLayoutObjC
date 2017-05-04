//
//  CrossFadeAttributesAnimator.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "CrossFadeAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation CrossFadeAttributesAnimator

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    
    CGFloat position = attributes.middleOffset;
    CGPoint contentOffset = collection.contentOffset;
    CGRect frame = CGRectZero;
    frame.origin = contentOffset;
    frame.size = attributes.frame.size;
    attributes.frame = frame;
    attributes.alpha = 1 - ABS(position);
    
}

@end
