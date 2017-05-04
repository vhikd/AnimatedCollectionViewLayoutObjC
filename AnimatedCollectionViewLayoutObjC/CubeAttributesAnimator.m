//
//  CubeAttributesAnimator.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "CubeAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation CubeAttributesAnimator

- (id)init {
    
    self = [super init];
    if (self) {
        self.perspective = -1.0 / 500.0;
        self.totalAngle = M_PI_2;
    }
    return self;
    
}

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    
    if (ABS(position) >= 1) {
        attributes.contentView.layer.transform = CATransform3DIdentity;
    } else if (attributes.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        CGFloat rotateAngle = _totalAngle * position;
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = _perspective;
        transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0);
        
        attributes.contentView.layer.transform = transform;
        CGPoint pot = CGPointMake(0, 0.5);
        if (position > 0) {
            pot.x = 0;
        }
        else {
            pot.x = 1;
        }
        
        [attributes.contentView keepCenterAndApplyAnchorPoint:pot];
    } 
}

@end
