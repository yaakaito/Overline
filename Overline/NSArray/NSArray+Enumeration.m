//
// Created by yaakaito on 2012/12/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+Enumeration.h"


@implementation NSArray (Enumeration)
//#ifdef OV_SHORTHAND
- (void)each:(void (^)(id, NSUInteger))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}
//#endif
@end