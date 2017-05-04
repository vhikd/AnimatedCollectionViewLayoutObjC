//
//  PageMoveIn.m
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import "PageMoveIn.h"

#import "HorizontalFlowLayout.h"

@implementation PageMoveIn

- (void)animateCollectionView:(UICollectionView *)collection attributes:(AnimatedCollectionViewLayoutAttributes *)attributes {
    
    NSIndexPath *indexPath = attributes.indexPath;
   
    CGSize _itemSize = attributes.frame.size;
    //获取滑动的位移
    //    CGFloat contentOffsetY = self.collectionView.contentOffset.y;
    CGFloat contentOffsetX = collection.contentOffset.x;
    NSInteger currentIndex = contentOffsetX/_itemSize.width;
    //    NSInteger startIndex = indexPath.row - currentIndex;
    
    
    if (indexPath.row <= currentIndex) {
        attributes.zIndex = 900000 - indexPath.row;
    }
    else {
        attributes.zIndex = indexPath.row;
    }
    
    if (attributes.endOffset <= 0 && attributes.endOffset > -1 ) {
        
//        NSLog(@"%.3f",attributes.endOffset);
        
        float ori = contentOffsetX - currentIndex*_itemSize.width-_itemSize.width;
        
        attributes.transform = CGAffineTransformTranslate(attributes.transform, ori, 0);
        
    }
    else if(attributes.middleOffset > 1){
        
//        NSLog(@"%.2f",-attributes.middleOffset*(contentOffsetX - (currentIndex+1)*_itemSize.width));
        
        attributes.transform = CGAffineTransformMakeTranslation( -attributes.middleOffset*(contentOffsetX - (currentIndex+1)*_itemSize.width), 0 );
    }
    else {
        attributes.transform = CGAffineTransformIdentity;
    }
    
}

@end
