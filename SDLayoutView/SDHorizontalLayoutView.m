//
//  SDHorizontalLayoutView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 18/04/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDHorizontalLayoutView.h"

@implementation SDHorizontalLayoutView

- (void) layoutSubviews
{
    [super layoutSubviews];
    NSArray *subviewsToLayout = [self layoutCapableSubviews];
    UIView *lastSubview = nil;
    CGFloat maxWidth = self.maximumSize.width == 0 ? CGFLOAT_MAX : self.maximumSize.width;
    for (UIView<UIViewDesiredWidth> *subview in subviewsToLayout) {
        CGFloat subviewWidth = [[subview desiredWidth] floatValue];
        CGRect subviewFrame = subview.frame;
        subviewFrame.size.width = subviewWidth;
        subviewFrame.origin.x = lastSubview.frame.origin.x + lastSubview.frame.size.width;
        if (subview.frame.origin.x + subview.frame.size.width > maxWidth) {
            subviewFrame.size.width = maxWidth - subview.frame.origin.x;
        }
        subview.frame = subviewFrame;
        lastSubview = subview;
    }
}

- (NSNumber*) desiredWidth
{
    NSArray *subviewsToLayout = [self layoutCapableSubviews];
    CGFloat runningTotal = 0.0f;
    BOOL first = YES;
    for (UIView<UIViewDesiredWidth> *subview in subviewsToLayout) {
        if (first) {
            first = NO;
            runningTotal += subview.frame.origin.x;
        }
        CGFloat subviewWidth = [[subview desiredWidth] floatValue];
        runningTotal += subviewWidth;
    }
    CGFloat maxWidth = self.maximumSize.width == 0 ? CGFLOAT_MAX : self.maximumSize.width;
    return @(MIN(runningTotal, maxWidth));
}

@end
