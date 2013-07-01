//
//  SDVerticalLayoutView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 6/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDVerticalLayoutView.h"

@implementation SDVerticalLayoutView

- (void) layoutSubviews
{
    [super layoutSubviews];
    NSArray *subviewsToLayout = [self layoutCapableSubviews];
    UIView *lastSubview = nil;
    CGFloat maxHeight = self.maximumSize.height == 0 ? CGFLOAT_MAX : self.maximumSize.height;
    for (UIView<UIViewDesiredHeight> *subview in subviewsToLayout) {
        CGFloat subviewHeight = [[subview desiredHeight] floatValue];
        CGRect subviewFrame = subview.frame;
        subviewFrame.size.height = subviewHeight;
        subviewFrame.origin.y = lastSubview.frame.origin.y + lastSubview.frame.size.height;
        if (subview.frame.origin.y + subview.frame.size.height > maxHeight) {
            subviewFrame.size.height = maxHeight - subview.frame.origin.y;
        }
        subview.frame = subviewFrame;
        lastSubview = subview;
    }
}

- (NSNumber*) desiredHeight
{
    NSArray *subviewsToLayout = [self layoutCapableSubviews];
    CGFloat runningTotal = 0.0f;
    BOOL first = YES;
    for (UIView<UIViewDesiredHeight> *subview in subviewsToLayout) {
        if (first) {
            first = NO;
            runningTotal += subview.frame.origin.y;
        }
        CGFloat subviewHeight = [[subview desiredHeight] floatValue];
        runningTotal += subviewHeight;
    }
    CGFloat maxHeight = self.maximumSize.height == 0 ? CGFLOAT_MAX : self.maximumSize.height;
    return @(MIN(runningTotal, maxHeight));
}

@end
