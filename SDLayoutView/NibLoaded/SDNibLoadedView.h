//
//  SDNibLoadedView.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 5/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SDNibLoadedView <NSObject>
@required
@property (nonatomic, readonly, assign) UIViewContentMode contentModeFromNib;
@property (nonatomic, readonly, assign) NSInteger tagFromNib;
@property (nonatomic, readonly, assign) CGRect frameFromNib;
@property (nonatomic, readonly, retain) UIColor *backgroundColorFromNib;
@property (nonatomic, readonly, assign) BOOL userInteractionEnabledFromNib;
@property (nonatomic, readonly, assign) BOOL multipleTouchEnabledFromNib;
@property (nonatomic, readonly, assign) CGFloat alphaFromNib;
@property (nonatomic, readonly, assign) BOOL opaqueFromNib;
@property (nonatomic, readonly, assign) BOOL hiddenFromNib;
@property (nonatomic, readonly, assign) BOOL clearsContextBeforeDrawingFromNib;
@property (nonatomic, readonly, assign) BOOL clipsToBoundsFromNib;
@property (nonatomic, readonly, assign) BOOL autoresizesSubviewsFromNib;
@property (nonatomic, readonly, assign) UIViewAutoresizing autoresizingMaskFromNib;
@property (nonatomic, readonly, assign) BOOL loadedFromNib;
@end

// USE THE BELOW ONLY IN YOUR SUBCLASS IMPLEMENTATION
@protocol SDNibLoadedViewReadWrite <NSObject>
@required
@property (nonatomic, readwrite, assign) UIViewContentMode contentModeFromNib;
@property (nonatomic, readwrite, assign) NSInteger tagFromNib;
@property (nonatomic, readwrite, assign) CGRect frameFromNib;
@property (nonatomic, readwrite, retain) UIColor *backgroundColorFromNib;
@property (nonatomic, readwrite, assign) BOOL userInteractionEnabledFromNib;
@property (nonatomic, readwrite, assign) BOOL multipleTouchEnabledFromNib;
@property (nonatomic, readwrite, assign) CGFloat alphaFromNib;
@property (nonatomic, readwrite, assign) BOOL opaqueFromNib;
@property (nonatomic, readwrite, assign) BOOL hiddenFromNib;
@property (nonatomic, readwrite, assign) BOOL clearsContextBeforeDrawingFromNib;
@property (nonatomic, readwrite, assign) BOOL clipsToBoundsFromNib;
@property (nonatomic, readwrite, assign) BOOL autoresizesSubviewsFromNib;
@property (nonatomic, readwrite, assign) UIViewAutoresizing autoresizingMaskFromNib;
@property (nonatomic, readwrite, assign) BOOL loadedFromNib;
@end

#define SYNTHESIZE_NIBLOADEDVIEW_PROPERTIES \
@synthesize contentModeFromNib, tagFromNib, frameFromNib, backgroundColorFromNib;\
@synthesize userInteractionEnabledFromNib, multipleTouchEnabledFromNib, alphaFromNib;\
@synthesize opaqueFromNib, hiddenFromNib, clearsContextBeforeDrawingFromNib, clipsToBoundsFromNib;\
@synthesize autoresizesSubviewsFromNib, autoresizingMaskFromNib, loadedFromNib

@interface SDNibLoadedView : UIView <SDNibLoadedView>

+ (void) saveNibPropertiesForNibLoadedView: (UIView<SDNibLoadedView>*) view;

@end
