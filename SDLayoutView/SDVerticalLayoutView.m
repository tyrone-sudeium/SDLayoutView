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
    for (UIView<SDViewDesiredHeight> *subview in subviewsToLayout) {
        CGFloat subviewHeight = [[self class] desiredHeightForLayoutCapableView: subview];
        CGRect subviewFrame = subview.frame;
        subviewFrame.size.height = subviewHeight;
        subviewFrame.origin.y = lastSubview.frame.origin.y + lastSubview.frame.size.height;
        if (self.maximumHeight && subview.frame.origin.y + subview.frame.size.height > self.maximumHeight.floatValue) {
            subviewFrame.size.height = self.maximumHeight.floatValue - subview.frame.origin.y;
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
    for (UIView<SDViewDesiredHeight> *subview in subviewsToLayout) {
        if (first) {
            first = NO;
            runningTotal += subview.frame.origin.y;
        }
        CGFloat subviewHeight = [[self class] desiredHeightForLayoutCapableView: subview];
        runningTotal += subviewHeight;
    }
    if (self.maximumHeight && runningTotal > self.maximumHeight.floatValue) {
        runningTotal = self.maximumHeight.floatValue;
    }
    return @(runningTotal);
}

@end
