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
@end