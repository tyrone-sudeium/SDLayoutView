//
//  SDNibLoadedTextView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 30-06-13.
//  Copyright (c) 2013 Sudeium. All rights reserved.
//

#import "SDNibLoadedTextView.h"

@interface SDNibLoadedTextView () <SDNibLoadedViewReadWrite>

@end

@implementation SDNibLoadedTextView
SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES;

- (void) awakeFromNib
{
    [super awakeFromNib];
    [SDNibLoadedView saveNibPropertiesForNibLoadedView: self];
}

@end
