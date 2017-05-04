//
//  RotateInOutAttributesAnimator.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "RotateInOutAttributesAnimator.h"
#import "HorizontalFlowLayout.h"

@implementation RotateInOutAttributesAnimator

- (id)init {
    
    self = [super init];
    if (self) {
        self.minAlpha = 0.0;
        self.maxRotate = M_PI_4;
    }
    return self;
    
}

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    
    CGFloat position = attributes.middleOffset;
    if (fabs(position) >= 1 ){
        attributes.transform = CGAffineTransformIdentity;
        attributes.alpha = 1.0;
    } else {
        CGFloat rotateFactor = _maxRotate * position;
        attributes.zIndex = attributes.indexPath.row;
        attributes.alpha = 1.0 - fabs(position) + _minAlpha;
        attributes.transform = CGAffineTransformMakeRotation(rotateFactor);
        //CGAffineTransform(rotationAngle: rotateFactor)
    }
}

@end
