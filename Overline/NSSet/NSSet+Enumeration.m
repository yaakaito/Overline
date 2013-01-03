//
// Created by yaakaito on 2013/01/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSSet+Enumeration.h"


@implementation NSSet (Enumeration)

- (void)each:(void (^)(id))block {
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        block(obj);
    }];
}

- (NSSet *)map:(id (^)(id))block {
    return [self mappedSetUsingBlock:block];
}

- (NSSet *)mappedSetUsingBlock:(id (^)(id))block {
    NSMutableSet *result = [NSMutableSet set];
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        id o = block(obj);
        if (o) {
            [result addObject:o];
        }
    }];
    return result;
}
@end