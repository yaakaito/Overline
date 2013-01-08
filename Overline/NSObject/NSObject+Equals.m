//
// Created by kazuma.ukyo on 12/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSObject+Equals.h"


@implementation NSObject (Equals)
- (BOOL)isNullObject {
    return [self isEqual:[NSNull null]];
}

- (BOOL)isArray {
    return [self isKindOfClass:[NSArray class]];
}

- (BOOL)isDictionary {
    return [self isKindOfClass:[NSDictionary class]];
}

- (BOOL)isSet {
    return [self isKindOfClass:[NSSet class]];
}

- (BOOL)isString {
    return [self isKindOfClass:[NSString class]];
}

- (BOOL)isNumber {
    return [self isKindOfClass:[NSNumber class]];
}
@end