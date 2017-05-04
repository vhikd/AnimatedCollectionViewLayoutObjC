//
//  ParallaxAttributesAnimator.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "ParallaxAttributesAnimator.h"

#import "HorizontalFlowLayout.h"

@implementation ParallaxAttributesAnimator

- (id)init {
    
    self = [super init];
    if (self) {
        self.speed = 0.5;
    }
    return self;
    
}

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    UIView *contentView = attributes.contentView;
    if(!contentView.superview.clipsToBounds)
        contentView.superview.clipsToBounds = YES;
    
    UICollectionViewScrollDirection direction = attributes.scrollDirection;
    
    if (fabs(position) >= 1) {
        contentView.frame = attributes.bounds;
    }
    else if(direction == UICollectionViewScrollDirectionHorizontal){
        
        CGFloat width = collection.frame.size.width;
        CGFloat transitionX = -(width * self.speed * position);
        CGAffineTransform transform = CGAffineTransformMakeTranslation(transitionX, 0);
        CGRect newFrame = CGRectApplyAffineTransform(attributes.bounds, transform);
        contentView.frame = newFrame;
    }
    
    attributes.zIndex = attributes.indexPath.row;
    
}

@end
