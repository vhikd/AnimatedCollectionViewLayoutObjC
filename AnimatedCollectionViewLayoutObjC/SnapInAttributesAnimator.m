//
//  SnapInAttributesAnimator.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "SnapInAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation SnapInAttributesAnimator


- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    
    CGFloat position = attributes.endOffset;
    
    if (position < 0 && position > -1) {
        if (attributes.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
            CGFloat translationX = (1 - pow(ABS(position), 3.0)) * attributes.frame.size.width / 4;
            CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(translationX, 0);
            //CGAffineTransform(translationX: translationX, y: 0)
            CGFloat scaleFactor = 0.8 - position * 0.2;
            attributes.transform = CGAffineTransformConcat(translationTransform, CGAffineTransformMakeScale(scaleFactor, scaleFactor));
            //translationTransform.concatenating(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        }
        
        attributes.alpha = 1.0 * ABS(position);
    } else {
        attributes.alpha = 1.0;
        attributes.transform = CGAffineTransformIdentity;
    }
    
}

@end
