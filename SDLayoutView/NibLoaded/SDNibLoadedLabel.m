//
//  SDNibLoadedLabel.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 5/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDNibLoadedLabel.h"

@interface SDNibLoadedLabel () <SDNibLoadedLabelReadWrite>
@end

@implementation SDNibLoadedLabel
SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES;
SYNTHESIZE_NIBLOADEDLABEL_PROPERTIES;


- (void) awakeFromNib
{
    [super awakeFromNib];
    [SDNibLoadedView saveNibPropertiesForNibLoadedView: self];
    [SDNibLoadedLabel saveNibPropertiesForNibLoadedLabel: self];
}

+ (void) saveNibPropertiesForNibLoadedLabel: (UILabel<SDNibLoadedLabelReadWrite>*) label
{
    label.textFromNib = label.text;
    label.numberOfLinesFromNib = label.numberOfLines;
    label.enabledFromNib = label.enabled;
    label.baselineAdjustmentFromNib = label.baselineAdjustment;
    label.lineBreakModeFromNib = label.lineBreakMode;
    label.textAlignmentFromNib = label.textAlignment;
    label.fontFromNib = label.font;
    label.minimumScaleFactorFromNib = label.minimumScaleFactor;
    label.adjustsFontSizeToFitWidthFromNib = label.adjustsFontSizeToFitWidth;
    label.textColorFromNib = label.textColor;
    label.highlightedTextColorFromNib = label.highlightedTextColor;
    label.shadowColorFromNib = label.shadowColor;
    label.shadowOffsetFromNib = label.shadowOffset;
}

@end
