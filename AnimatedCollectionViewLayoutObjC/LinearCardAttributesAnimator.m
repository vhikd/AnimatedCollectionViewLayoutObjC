//
//  LinearCardAttributesAnimator.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "LinearCardAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation LinearCardAttributesAnimator

- (id)init {
    
    self = [super init];
    if (self) {
        self.minAlpha = .5;
        self.scaleRate = .7;
        self.itemSpacing = .4;
    }
    return self;
    
}

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    CGFloat scaleFactor = _scaleRate - 0.1 * ABS(position);
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    //CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    
    CGAffineTransform translationTransform;
    
    if (attributes.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        CGFloat width = collection.frame.size.width;
        CGFloat translationX = -(width * _itemSpacing * position);
        translationTransform = CGAffineTransformMakeTranslation(translationX, 0);
        //CGAffineTransform(translationX: translationX, y: 0)
    } else {
        CGFloat height = collection.frame.size.height;
        CGFloat translationY = -(height * _itemSpacing * position);
        translationTransform = CGAffineTransformMakeTranslation(0, translationY);
        //CGAffineTransform(translationX: 0, y: translationY)
    }
    
    attributes.alpha = 1.0 - ABS(position) + _minAlpha;
    
    attributes.transform = CGAffineTransformConcat(translationTransform, scaleTransform);
    
}

@end
