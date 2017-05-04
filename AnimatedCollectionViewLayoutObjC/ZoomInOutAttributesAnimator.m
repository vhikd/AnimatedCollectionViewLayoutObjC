//
//  ZoomInOutAttributesAnimator.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "ZoomInOutAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation ZoomInOutAttributesAnimator

- (id)init {
    
    self = [super init];
    if (self) {
        self.scaleRate = 0.2;
    }
    return self;
    
}

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    
    if (position <= 0 && position > -1) {
        CGFloat scaleFactor = _scaleRate * position + 1.0;
        attributes.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
        //CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    } else {
        attributes.transform = CGAffineTransformIdentity;//.identity
    }
}

@end
