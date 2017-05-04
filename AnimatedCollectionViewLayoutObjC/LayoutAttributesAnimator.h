//
//  LayoutAttributesAnimator.h
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import <UIKit/UIKit.h>

@class AnimatedCollectionViewLayoutAttributes;

@interface LayoutAttributesAnimator : NSObject

- (void)animateCollectionView:(UICollectionView *)collection
                   attributes:(AnimatedCollectionViewLayoutAttributes *)attributes;

@end
