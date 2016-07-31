//
//  MainTableViewController.h
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ValueTableDelegate


- (void) valueTypeWasChosen: (NSString *) valueTypeChosen;


@end

@interface MainTableViewController : UITableViewController


@end
