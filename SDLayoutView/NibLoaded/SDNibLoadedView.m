//
//  SDNibLoadedView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 5/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDNibLoadedView.h"



@interface SDNibLoadedView () <SDNibLoadedViewReadWrite>
@end

@implementation SDNibLoadedView
SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES;

+ (void) saveNibPropertiesForNibLoadedView:(UIView<SDNibLoadedView> *)view
{
    if (![view conformsToProtocol: @protocol(SDNibLoadedViewReadWrite)]) {
        return;
    }
    UIView<SDNibLoadedViewReadWrite>* nibLoadedView = (UIView<SDNibLoadedViewReadWrite>*) view;
    nibLoadedView.contentModeFromNib = nibLoadedView.contentMode;
    nibLoadedView.tagFromNib = nibLoadedView.tag;
    nibLoadedView.frameFromNib = nibLoadedView.frame;
    nibLoadedView.backgroundColorFromNib = nibLoadedView.backgroundColor;
    nibLoadedView.userInteractionEnabledFromNib = nibLoadedView.userInteractionEnabled;
    nibLoadedView.multipleTouchEnabledFromNib = nibLoadedView.multipleTouchEnabled;
    nibLoadedView.alphaFromNib = nibLoadedView.alpha;
    nibLoadedView.opaqueFromNib = nibLoadedView.opaque;
    nibLoadedView.hiddenFromNib = nibLoadedView.hidden;
    nibLoadedView.clearsContextBeforeDrawingFromNib = nibLoadedView.clearsContextBeforeDrawing;
    nibLoadedView.clipsToBoundsFromNib = nibLoadedView.clipsToBounds;
    nibLoadedView.autoresizesSubviewsFromNib = nibLoadedView.autoresizesSubviews;
    nibLoadedView.autoresizingMaskFromNib = nibLoadedView.autoresizingMask;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [SDNibLoadedView saveNibPropertiesForNibLoadedView: self];
    self.loadedFromNib = YES;
}

@end
