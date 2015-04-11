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
    for (UIView<SDViewDesiredWidth> *subview in subviewsToLayout) {
        CGFloat subviewWidth = [[self class] desiredWidthForLayoutCapableView: subview];
        CGRect subviewFrame = subview.frame;
        subviewFrame.size.width = subviewWidth;
        subviewFrame.origin.x = lastSubview.frame.origin.x + lastSubview.frame.size.width;
        if (self.maximumWidth && subview.frame.origin.x + subview.frame.size.width > self.maximumWidth.floatValue) {
            subviewFrame.size.width = self.maximumWidth.floatValue - subview.frame.origin.x;
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
    for (UIView<SDViewDesiredWidth> *subview in subviewsToLayout) {
        if (first) {
            first = NO;
            runningTotal += subview.frame.origin.x;
        }
        CGFloat subviewWidth = [[self class] desiredWidthForLayoutCapableView: subview];
        runningTotal += subviewWidth;
    }
    if (self.maximumWidth && runningTotal > self.maximumWidth.floatValue) {
        runningTotal = self.maximumWidth.floatValue;
    }
    return @(runningTotal);
}

@end
