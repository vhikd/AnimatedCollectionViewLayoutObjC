//
//  PageAttributesAnimator.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "PageAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation PageAttributesAnimator


- (id)init {
    
    self = [super init];
    if (self) {
        self.scaleRate = .2;
    }
    return self;
    
}

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    
    CGFloat position = attributes.middleOffset;
    CGPoint contentOffset = collection.contentOffset;
    CGPoint itemOrigin = attributes.frame.origin;
    CGFloat scaleFactor = _scaleRate * MIN(position, 0) + 1.0;
    CGAffineTransform transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    //CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    
    if (attributes.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeTranslation(position < 0 ? contentOffset.x - itemOrigin.x : 0, 0));
        //transform.concatenating(CGAffineTransform(translationX: position < 0 ? contentOffset.x - itemOrigin.x : 0, y: 0))
    }
//    else {
//        transform = transform.concatenating(CGAffineTransform(translationX: 0, y: position < 0 ? contentOffset.y - itemOrigin.y : 0))
//    }
    
    attributes.transform = transform;
    attributes.zIndex = attributes.indexPath.row;
    
}

@end
