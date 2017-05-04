//
//  HorizontalFlowLayout.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "HorizontalFlowLayout.h"



@interface HorizontalFlowLayout () {
    
}


@end

@implementation HorizontalFlowLayout


+ (Class)layoutAttributesClass {
    
    return [AnimatedCollectionViewLayoutAttributes class];
}


- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *arr_atts = [NSMutableArray arrayWithCapacity:3];
    
    for (int i=0; i<array.count; i++) {
        
        UICollectionViewLayoutAttributes *att = array[i];
        AnimatedCollectionViewLayoutAttributes *ani = [att copy];
        [arr_atts addObject:[self transformLayoutAttributes:ani]];
    }
    
    return arr_atts;
    
}

/*
- (UICollectionViewLayoutAttributes *)tLayoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath withAttr:(AnimatedCollectionViewLayoutAttributes *)attributes{
    
    UICollectionView *collectView = self.collectionView;
    CGFloat distance = collectView.frame.size.width;
    CGFloat itemOffset = attributes.center.x - collectView.contentOffset.x;
    float middleOffset = itemOffset / distance - 0.5;
    
    CGSize _itemSize = attributes.frame.size;
    //获取滑动的位移
//    CGFloat contentOffsetY = self.collectionView.contentOffset.y;
    CGFloat contentOffsetX = self.collectionView.contentOffset.x;
    NSInteger currentIndex = contentOffsetX/_itemSize.width;
//    NSInteger startIndex = indexPath.row - currentIndex;
    
    if (indexPath.row >= currentIndex) {
        attributes.zIndex = 900000 - indexPath.row;
    }
    else {
        attributes.zIndex = indexPath.row;
    }
    
    
    if (indexPath.row == currentIndex ) {
        attributes.transform = CGAffineTransformMakeTranslation( -middleOffset*(contentOffsetX - currentIndex*_itemSize.width), 0 );
    }
    else {
        
        attributes.transform = CGAffineTransformMakeTranslation( (contentOffsetX - currentIndex*_itemSize.width), 0 );
    }
    return attributes;
}*/

- (UICollectionViewLayoutAttributes *)transformLayoutAttributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
//    if ([self.animator isKindOfClass:NSClassFromString(@"PageMoveIn")]) {
//        return [self tLayoutAttributesForItemAtIndexPath:attributes.indexPath
//                                                withAttr:attributes];
//    }
    
    UICollectionView *collectView = self.collectionView;
    
    AnimatedCollectionViewLayoutAttributes *att = attributes;
    
    CGFloat distance = collectView.frame.size.width;
    CGFloat itemOffset = att.center.x - collectView.contentOffset.x;
    att.startOffset = (att.frame.origin.x - collectView.contentOffset.x) / att.frame.size.width;
    att.endOffset = (att.frame.origin.x - collectView.contentOffset.x - collectView.frame.size.width) / att.frame.size.width;
    
    att.scrollDirection = self.scrollDirection;
    att.middleOffset = itemOffset / distance - 0.5;
    
    // Cache the contentView since we're going to use it a lot.
    if (!att.contentView) {
        att.contentView = [[collectView cellForItemAtIndexPath:att.indexPath] contentView];
    }
    
    
    if(self.animator)
        [self.animator animateCollectionView:self.collectionView attributes:att];
    
    return att;
    
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    
    return self.shouldReLayout;
}

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity  {
//    
//}


@end


@implementation AnimatedCollectionViewLayoutAttributes


- (id)copyWithZone:(NSZone *)zone {
    
    AnimatedCollectionViewLayoutAttributes *copy = [super copyWithZone:zone];
    copy.contentView = self.contentView;
    copy.scrollDirection = self.scrollDirection;
    copy.startOffset = self.startOffset;
    copy.middleOffset = self.middleOffset;
    copy.endOffset = self.endOffset;
    return copy;
}

- (BOOL)isEqual:(id)object {
    
    if (![object isKindOfClass:[AnimatedCollectionViewLayoutAttributes class]]) {
        return NO;
    }
    
    AnimatedCollectionViewLayoutAttributes *att = object;
    
    return ([att.contentView isEqual:self.contentView] &&
            att.scrollDirection == self.scrollDirection &&
            att.startOffset == self.startOffset &&
            att.middleOffset == self.middleOffset &&
            att.endOffset == self.endOffset);
    
}

@end


