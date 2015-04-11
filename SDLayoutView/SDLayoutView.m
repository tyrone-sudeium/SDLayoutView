//
//  SDLayoutView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 1/07/13.
//  Copyright (c) 2013 Sudeium. All rights reserved.
//

#import "SDLayoutView.h"

@implementation SDLayoutView

- (NSArray*) layoutCapableSubviews
{
    NSArray *subviewsToLayout = [self.subviews filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([evaluatedObject conformsToProtocol: @protocol(SDViewDesiredHeight)] ||
            [evaluatedObject conformsToProtocol: @protocol(SDViewDesiredWidth)])
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
    CGSize s = [SDView desiredSizeForLayoutCapableView: self];
    CGRect f = self.frame;
    f.size = s;
    self.frame = f;
}

@end
