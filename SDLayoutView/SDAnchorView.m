//
//  SDAnchorView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 25-01-13.
//  Copyright (c) 2013 Sudeium. All rights reserved.
//

#import "SDAnchorView.h"

@implementation SDAnchorView

- (void) layoutSubviews
{
    NSAssert(self.subviews.count <= 1, @"Anchor view must have just ONE subview!");
    UIView *subview = self.subviews[0];
    CGRect subFrame = subview.frame;
    if ([subview respondsToSelector: @selector(desiredHeight)]) {
        subFrame.size.height = [[subview valueForKey: @"desiredHeight"] floatValue];
    }
    if ([subview respondsToSelector: @selector(desiredWidth)]) {
        subFrame.size.width = [[subview valueForKey: @"desiredWidth"] floatValue];
    }
    subFrame.origin.x = (self.frame.size.width * self.anchorPoint.x) - (subFrame.size.width * self.anchorPoint.x);
    subFrame.origin.y = (self.frame.size.height * self.anchorPoint.y) - (subFrame.size.height * self.anchorPoint.y);
    subview.frame = subFrame;
}

@end
