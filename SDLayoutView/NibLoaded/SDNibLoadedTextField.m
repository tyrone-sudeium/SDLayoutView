//
//  SDNibLoadedTextField.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 9/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDNibLoadedTextField.h"

@interface SDNibLoadedTextField () <SDNibLoadedViewReadWrite>

@end

@implementation SDNibLoadedTextField
SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES;

- (void) awakeFromNib
{
    [super awakeFromNib];
    [SDNibLoadedView saveNibPropertiesForNibLoadedView: self];
}

@end
