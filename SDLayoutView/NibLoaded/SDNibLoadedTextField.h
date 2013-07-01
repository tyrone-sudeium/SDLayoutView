//
//  SDNibLoadedTextField.h
//  SDLayoutView
//
//  Created by Tyrone Trevorrow on 9/03/12.
//  Copyright (c) 2012 Sudeium. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDNibLoadedView.h"

// Sigh, TextFields have a lot of IB-settable properties and I really can't
// be bothered to implement all of them right now.
// TODO: Finish this class.

@interface SDNibLoadedTextField : UITextField <SDNibLoadedView>

@end
