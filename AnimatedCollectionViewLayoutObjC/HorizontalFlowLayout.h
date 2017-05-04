//
//  HorizontalFlowLayout.h
//  BookWorksApp
//
//  Created by 刁志远 on 2017/4/26.
//
//

#import <UIKit/UIKit.h>

#import "LayoutAttributesAnimator.h"

@interface HorizontalFlowLayout : UICollectionViewFlowLayout

/*
 The animator. Can be nil; if the animator is nil, no animation will be showed;
 
 */
@property (nonatomic, strong) LayoutAttributesAnimator *animator;


/*
 If the animator not nil, this attribute should be YES . After that the animation 
 will be showed;
 */

@property (assign) BOOL shouldReLayout;

@end



@interface AnimatedCollectionViewLayoutAttributes : UICollectionViewLayoutAttributes


@property (nonatomic,strong) UIView *contentView;
@property (assign) UICollectionViewScrollDirection scrollDirection;
@property (assign) CGFloat startOffset;
@property (assign) CGFloat middleOffset;
@property (assign) CGFloat endOffset;

@end
