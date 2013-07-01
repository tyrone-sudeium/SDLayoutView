//
//  SDView.m
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 9/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import "SDView.h"
#import <objc/runtime.h>

@interface __WeakWrapper : NSObject
@end

@implementation __WeakWrapper {
    @public
    __weak id _obj;
}
- (id) initWithObj: (id) obj
{
    self = [super init];
    if (self) {
        _obj = obj;
    }
    return self;
}
@end

@implementation UIView (SDNibLoadedView)

- (CGFloat) topMargin
{
    return self.frame.origin.y;
}

- (void) setTopMargin:(CGFloat)topMargin
{
    CGRect f = self.frame;
    f.origin.y = topMargin;
    self.frame = f;
}

- (CGFloat) bottomMargin
{
    return self.superview.frame.size.height - self.frame.origin.y - self.frame.size.height;
}

- (void) setBottomMargin:(CGFloat)bottomMargin
{
    CGRect f = self.frame;
    f.size.height = self.superview.frame.size.height - self.frame.origin.y - bottomMargin;
    self.frame = f;
}

- (CGFloat) topMarginFromNib
{
    NSAssert([self conformsToProtocol: @protocol(SDNibLoadedView)] || [self conformsToProtocol:@protocol(SDNibLoadedViewReadWrite)], @"fatal: calling topMarginFromNib on a non-NibLoadedView.");
    SDNibLoadedView* nibLoadedSelf = (SDNibLoadedView*) self;
    return nibLoadedSelf.frameFromNib.origin.y;
}

- (CGFloat) bottomMarginFromNib
{
    NSAssert([self conformsToProtocol: @protocol(SDNibLoadedView)] || [self conformsToProtocol:@protocol(SDNibLoadedViewReadWrite)], @"fatal: calling topMarginFromNib on a non-NibLoadedView.");
    SDNibLoadedView* nibLoadedSelf = (SDNibLoadedView*) self;
    CGFloat superSize;
    if ([self.superview conformsToProtocol: @protocol(SDNibLoadedView)] || [self.superview conformsToProtocol:@protocol(SDNibLoadedViewReadWrite)])
    {
        superSize = ((SDNibLoadedView*)self.superview).frameFromNib.size.height;
    } else {
        superSize = self.superview.frame.size.height;
    }
    return superSize - nibLoadedSelf.frameFromNib.origin.y - nibLoadedSelf.frameFromNib.size.height;
}

- (void) fadeInOver:(NSTimeInterval)timeInterval
{
    self.alpha = 0;
    self.hidden = NO;
    [UIView animateWithDuration: timeInterval
                     animations:^{
                         self.alpha = 1;
                     }
                     completion:NULL];
}

- (void) fadeOutOver:(NSTimeInterval)timeInterval
{
    self.alpha = 1;
    self.hidden = NO;
    [UIView animateWithDuration: timeInterval
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL completed){
                         if (completed) {
                             self.hidden = YES;
                         }
                     }];
}

- (void) setRelatedObject:(id)relatedObject
{
    objc_setAssociatedObject(self, "SDView::relatedObject", [[__WeakWrapper alloc] initWithObj: relatedObject], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id) relatedObject
{
    __WeakWrapper *obj = objc_getAssociatedObject(self, "SDView::relatedObject");
    return obj->_obj;
}

- (void) setTaggedObject:(id)taggedObject
{
    objc_setAssociatedObject(self, "SDView::taggedObject", taggedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id) taggedObject
{
    return objc_getAssociatedObject(self, "SDView::taggedObject");
}

@end

@implementation SDView

- (void) awakeFromNib
{
    [super awakeFromNib];
}

- (NSNumber*) desiredHeight
{
    // The default implementation is to just return the frame height.
    return @(self.frame.size.height);
}

- (NSNumber*) desiredWidth
{
    // The default implementation is to just return the frame width.
    return @(self.frame.size.width);
}

@end
