//
//  SDViewDesiredWidth.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 10/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import <Foundation/Foundation.h>

// Declares a view which can be asked for its optimal width.
// Similar in concept to UIKit's built in "sizeToFit", except
// it doesn't actually do the resizing, just returns how large
// it would like to be.  i.e It doesn't suck.
@protocol SDViewDesiredWidth <NSObject>
@required
- (NSNumber*) desiredWidth;
@property (nonatomic, copy) IBInspectable NSNumber* maximumWidth;
@property (nonatomic, copy) IBInspectable NSNumber* minimumWidth;
@end
