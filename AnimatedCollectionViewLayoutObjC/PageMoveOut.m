//
//  PageMoveOut.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "PageMoveOut.h"

#import "HorizontalFlowLayout.h"

@implementation PageMoveOut


- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    CGFloat position = attributes.middleOffset;
    CGPoint contentOffset = collection.contentOffset;
    CGPoint itemOrigin = attributes.frame.origin;
    CGFloat scaleFactor = 0;//1.0 * MIN(position, 0) + 1.0;
    CGAffineTransform transform = CGAffineTransformMakeTranslation(scaleFactor, scaleFactor);//CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    
    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeTranslation(position < 0 ? contentOffset.x - itemOrigin.x : 0, 0));
    
    
    attributes.transform = transform;
    attributes.zIndex = attributes.indexPath.row+attributes.indexPath.section*100;
    
}

@end
