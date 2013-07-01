//
//  SDNibLoadedTableViewCellCell.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 14/04/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDNibLoadedTableViewCell.h"

@interface SDNibLoadedTableViewCell () <SDNibLoadedViewReadWrite>
@end

@implementation SDNibLoadedTableViewCell
SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES;

- (void) awakeFromNib
{
    [super awakeFromNib];
    [SDNibLoadedView saveNibPropertiesForNibLoadedView: self];
}

@end
