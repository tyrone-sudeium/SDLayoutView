//
//  SDNibLoadedButton.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 9/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDNibLoadedButton.h"

@interface SDNibLoadedButton () <SDNibLoadedViewReadWrite>
@end

@implementation SDNibLoadedButton
SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES;

- (void) awakeFromNib
{
    [super awakeFromNib];
    [SDNibLoadedView saveNibPropertiesForNibLoadedView: self];
}

@end
