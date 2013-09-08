//
// Created by kazuma.ukyo on 12/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSNumber+OVEquals.h"


@implementation NSNumber (OVEquals)
- (BOOL)isEqualToInt:(int)value {
    return [self intValue] == value;
}

- (BOOL)isEqualToInteger:(NSInteger)value {
    return [self integerValue] == value;
}

- (BOOL)isEqualToUnsignedInt:(unsigned int)value {
    return [self unsignedIntValue] == value;
}

- (BOOL)isEqualToUnsignedInteger:(NSUInteger)value {
    return [self unsignedIntegerValue] == value;
}

- (BOOL)isEqualToLong:(long)value {
    return [self longValue] == value;
}

- (BOOL)isEqualToLongLong:(long long int)value {
    return [self longLongValue] == value;
}

- (BOOL)isEqualToUnsignedLong:(unsigned long)value {
    return [self unsignedLongValue] == value;
}

- (BOOL)isEqualToUnsignedLongLong:(unsigned long long)value {
    return [self unsignedLongLongValue] == value;
}

- (BOOL)isEqualToDouble:(double)value {
    return [self doubleValue] == value;
}

- (BOOL)isEqualToFloat:(float)value {
    return [self floatValue] == value;
}
@end