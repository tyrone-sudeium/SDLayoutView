//
//  SDView.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 9/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDNibLoadedView.h"
#import "UIViewDesiredHeight.h"
#import "UIViewDesiredWidth.h"
#import "UIView+LoadFromNib.h"

@interface UIView (SDView)
@property (assign, nonatomic) CGFloat topMargin;
@property (assign, nonatomic) CGFloat bottomMargin;
@property (readonly, nonatomic) CGFloat topMarginFromNib;
@property (readonly, nonatomic) CGFloat bottomMarginFromNib;
@property (weak, nonatomic) id relatedObject;
@property (strong, nonatomic) id taggedObject;
- (void) fadeInOver: (NSTimeInterval) timeInterval;
- (void) fadeOutOver: (NSTimeInterval) timeInterval;
@end

@interface SDView : SDNibLoadedView <UIViewDesiredHeight, UIViewDesiredWidth>

@end
