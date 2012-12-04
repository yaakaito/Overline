//
// Created by yaakaito on 2012/12/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+Enumeration.h"


@implementation NSArray (Enumeration)
- (void)each:(void (^)(id, NSUInteger))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)map:(id (^)(id, NSUInteger))block {
    return [self mappedArrayUsingBlock:block];
}

- (NSArray *)mappedArrayUsingBlock:(id (^)(id, NSUInteger))block {
    NSMutableArray *mappedArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id o = block(obj, idx);
        if (o != nil) {
            [mappedArray addObject:o];
        }
    }];
    return mappedArray;
}
@end