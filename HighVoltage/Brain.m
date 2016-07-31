//
//  Brain.m
//  HighVoltage
//
//  Created by Ross Gottschalk on 7/28/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Brain.h"
typedef enum
{
    OperatorTypeNone,
    OperatorTypeAddition,
    OperatorTypeSubtraction,
    OperatorTypeMultiplication,
    OperatorTypeDivision
} OperatorType;

@interface Brain ()

@property (nonatomic, copy) NSMutableString *operand1String;
@property (nonatomic, copy) NSMutableString *operand2String;

@property (assign) OperatorType operatorType;
@end


@implementation Brain


-(instancetype) init;
{
    self = [super init];
    if (self)
    {
        _operand1String = [[NSMutableString alloc] init];
        _operand2String = [[NSMutableString alloc] init];
        _operatorType = OperatorTypeNone;
    }
    return self;
}






@end
