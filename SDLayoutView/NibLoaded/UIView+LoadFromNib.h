//
//  UIView+LoadFromNib.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 10/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LoadFromNib)

+ (id) loadFromNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)bundle filesOwner:(id)filesOwner;
// Uses filesOwner = nil
+ (id) loadFromNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)bundle;
// Uses bundle = [NSBundle mainBundle] and filesOwner = nil
+ (id) loadFromNibName: (NSString *)nibNameOrNil;

@end
