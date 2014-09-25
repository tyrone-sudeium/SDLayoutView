//
//  SDLayoutView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 1/07/13.
//  Copyright (c) 2013 Sudeium. All rights reserved.
//

#import "SDLayoutView.h"

@implementation SDLayoutView {
    BOOL _maximumSizeSet;
    BOOL _minimumSizeSet;
}
@synthesize maximumSize=_maximumSize;
@synthesize minimumSize=_minimumSize;

- (void) setMaximumSize:(CGSize)maximumSize
{
    _maximumSize = maximumSize;
    _maximumSizeSet = YES;
}

- (CGSize) maximumSize
{
    if (!_maximumSizeSet) {
        return CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    } else {
        return _maximumSize;
    }
}

- (void) setMinimumSize:(CGSize)minimumSize
{
    _minimumSize = minimumSize;
    _minimumSizeSet = YES;
}

- (CGSize) minimumSize
{
    if (!_minimumSizeSet) {
        return CGSizeMake(0,0);
    } else {
        return _minimumSize;
    }
}

- (NSArray*) layoutCapableSubviews
{
    NSArray *subviewsToLayout = [self.subviews filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([evaluatedObject conformsToProtocol: @protocol(UIViewDesiredHeight)] ||
            [evaluatedObject conformsToProtocol: @protocol(UIViewDesiredWidth)])
        {
            return YES;
        } else {
            return NO;
        }
    }]];
    return subviewsToLayout;
}

- (void) sizeToFit
{
    [super sizeToFit];
    CGSize s = CGSizeMake(MIN(self.maximumSize.width, self.desiredWidth.floatValue),
                          MIN(self.maximumSize.height, self.desiredHeight.floatValue));
    CGRect f = self.frame;
    f.size = s;
    self.frame = f;
}

@end
