//
//  ValueTableViewController.h
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/29/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"

@interface ValueTableViewController : UITableViewController

@property (strong, nonatomic) id<ValueTableDelegate> delegate;



@end
