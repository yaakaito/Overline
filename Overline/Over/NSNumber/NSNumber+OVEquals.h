//
// Created by kazuma.ukyo on 12/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSNumber (OVEquals)
- (BOOL)isEqualToInt:(int)value;
- (BOOL)isEqualToInteger:(NSInteger)value;
- (BOOL)isEqualToUnsignedInt:(unsigned int)value;
- (BOOL)isEqualToUnsignedInteger:(NSUInteger)value;
- (BOOL)isEqualToLong:(long)value;
- (BOOL)isEqualToLongLong:(long long)value;
- (BOOL)isEqualToUnsignedLong:(unsigned long)value;
- (BOOL)isEqualToUnsignedLongLong:(unsigned long long)value;
- (BOOL)isEqualToDouble:(double)value;
- (BOOL)isEqualToFloat:(float)value;
@end