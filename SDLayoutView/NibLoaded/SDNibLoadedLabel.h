//
//  SDNibLoadedLabel.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 5/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDNibLoadedView.h"

@protocol SDNibLoadedLabel <SDNibLoadedView>
@property (nonatomic, readonly, retain) NSString *textFromNib;
@property (nonatomic, readonly, assign) NSInteger numberOfLinesFromNib;
@property (nonatomic, readonly, assign) BOOL enabledFromNib;
@property (nonatomic, readonly, assign) UIBaselineAdjustment baselineAdjustmentFromNib;
@property (nonatomic, readonly, assign) NSLineBreakMode lineBreakModeFromNib;
@property (nonatomic, readonly, assign) NSTextAlignment textAlignmentFromNib;
@property (nonatomic, readonly, retain) UIFont *fontFromNib;
@property (nonatomic, readonly, assign) CGFloat minimumScaleFactorFromNib;
@property (nonatomic, readonly, assign) BOOL adjustsFontSizeToFitWidthFromNib;
@property (nonatomic, readonly, retain) UIColor *textColorFromNib;
@property (nonatomic, readonly, retain) UIColor *highlightedTextColorFromNib;
@property (nonatomic, readonly, retain) UIColor *shadowColorFromNib;
@property (nonatomic, readonly, assign) CGSize shadowOffsetFromNib;
@end

@protocol SDNibLoadedLabelReadWrite <SDNibLoadedViewReadWrite>
@property (nonatomic, readwrite, retain) NSString *textFromNib;
@property (nonatomic, readwrite, assign) NSInteger numberOfLinesFromNib;
@property (nonatomic, readwrite, assign) BOOL enabledFromNib;
@property (nonatomic, readwrite, assign) UIBaselineAdjustment baselineAdjustmentFromNib;
@property (nonatomic, readwrite, assign) NSLineBreakMode lineBreakModeFromNib;
@property (nonatomic, readwrite, assign) NSTextAlignment textAlignmentFromNib;
@property (nonatomic, readwrite, retain) UIFont *fontFromNib;
@property (nonatomic, readwrite, assign) CGFloat minimumScaleFactorFromNib;
@property (nonatomic, readwrite, assign) BOOL adjustsFontSizeToFitWidthFromNib;
@property (nonatomic, readwrite, retain) UIColor *textColorFromNib;
@property (nonatomic, readwrite, retain) UIColor *highlightedTextColorFromNib;
@property (nonatomic, readwrite, retain) UIColor *shadowColorFromNib;
@property (nonatomic, readwrite, assign) CGSize shadowOffsetFromNib;
@end

#define SYNTHESIZE_NIBLOADEDLABEL_PROPERTIES \
@synthesize textFromNib, numberOfLinesFromNib, enabledFromNib, baselineAdjustmentFromNib;\
@synthesize lineBreakModeFromNib, textAlignmentFromNib, fontFromNib, minimumScaleFactorFromNib;\
@synthesize adjustsFontSizeToFitWidthFromNib, textColorFromNib, highlightedTextColorFromNib;\
@synthesize shadowColorFromNib, shadowOffsetFromNib

@interface SDNibLoadedLabel : UILabel <SDNibLoadedLabel>

+ (void) saveNibPropertiesForNibLoadedLabel: (UILabel<SDNibLoadedLabel>*) label;

@end
