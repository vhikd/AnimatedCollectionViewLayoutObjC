//
//  UIView+Anchor.m
//  AnimatedCollectionViewLayoutObjC
//
//  Created by 刁志远 on 2017/5/3.
//  Copyright © 2017年 刁志远. All rights reserved.
//

#import "UIView+Anchor.h"

@implementation UIView (Anchor)

- (void)keepCenterAndApplyAnchorPoint:(CGPoint)pot {
    
    if (self.layer.anchorPoint.x == pot.x &&
        self.layer.anchorPoint.y == pot.y) {
        return;
    }

    
    CGPoint newPoint = CGPointMake(self.bounds.size.width*pot.x, self.bounds.size.height*pot.y);
    CGPoint oldPoint = CGPointMake(self.bounds.size.width * self.layer.anchorPoint.x,
                                   self.bounds.size.height*self.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, self.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, self.transform);
    
    CGPoint c = self.layer.position;
    c.x -= oldPoint.x;
    c.x += newPoint.x;
    
    c.y -= oldPoint.y;
    c.y += newPoint.y;
    
    self.layer.position = c;
    self.layer.anchorPoint = pot;
    
    
}

@end
