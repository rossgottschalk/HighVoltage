//
//  CustomTableViewCell.h
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/31/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *ValueTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *ValueText;


@end
