//
//  SDGridLayoutView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 24/06/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDGridLayoutView.h"

@implementation SDGridLayoutView {
    BOOL needsLayout;
    CGFloat desiredHeight;
}

- (NSArray*) layoutCapableSubviews
{
    NSArray *subviewsToLayout = [self.subviews filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([evaluatedObject conformsToProtocol: @protocol(UIViewDesiredHeight)] && [evaluatedObject conformsToProtocol: @protocol(UIViewDesiredWidth)]) {
            return YES;
        } else {
            return NO;
        }
    }]];
    return subviewsToLayout;
}

- (NSNumber*) desiredWidth
{
    return @(self.frameFromNib.size.width);
}

- (NSNumber*) desiredHeight
{
    return @([self heightRequiredLayingOutSubviews]);
}

- (void) setNeedsLayout
{
    [super setNeedsLayout];
    needsLayout = YES;
}

- (CGFloat) heightRequiredLayingOutSubviews
{
    if (!needsLayout) {
        return desiredHeight;
    }
    NSArray *subviewsToLayout = [self layoutCapableSubviews];
    CGFloat remainingWidth = self.bounds.size.width;
    CGFloat rowHeight = 0.0f;
    CGFloat currentY = 0.0f;
    CGFloat currentX = 0.0f;
    for (UIView<UIViewDesiredHeight,UIViewDesiredWidth> *subview in subviewsToLayout) {
        CGFloat itemWidth = [[subview desiredWidth] floatValue];
        CGFloat itemHeight = [[subview desiredHeight] floatValue];
        rowHeight = MAX(rowHeight, itemHeight);
        
        if (remainingWidth - itemWidth < 0) {
            // New row
            currentY += rowHeight;
            currentX = 0;
            rowHeight = 0.0f;
            remainingWidth = self.bounds.size.width;
        }
        
        subview.frame = CGRectMake(currentX, currentY, itemWidth, itemHeight);
        currentX += itemWidth;
        remainingWidth -= itemWidth;
    }
    desiredHeight = currentY + rowHeight;
    return desiredHeight;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self heightRequiredLayingOutSubviews];
    needsLayout = NO;
}

@end
