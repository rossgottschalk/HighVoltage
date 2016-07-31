//
//  Brain.h
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brain : NSObject

- (NSString *)addOperandDigit:(NSString *)digit;
- (NSString *)addOperator:(NSString *)operatorValue;
- (NSString *)performCalculationIfPossible;
@end
