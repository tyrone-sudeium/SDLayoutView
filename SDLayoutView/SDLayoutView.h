//
//  SDLayoutView.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 1/07/13.
//  Copyright (c) 2013 Sudeium. All rights reserved.
//

#import "SDView.h"

@interface SDLayoutView : SDView
@property (nonatomic, assign) CGSize maximumSize;

- (NSArray*) layoutCapableSubviews;

@end
