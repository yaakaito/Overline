//
// Created by yaakaito on 2013/01/10.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+OVSubArray.h"


@implementation NSArray (OVSubArray)

- (NSArray *)subarrayFromIndex:(NSUInteger)index {
    return [self subarrayFromIndex:index length:[self count] - index];
}

- (NSArray *)subarrayFromIndex:(NSUInteger)index length:(NSUInteger)length {
    return [self subarrayWithRange:NSMakeRange(index, length)];
}

- (NSArray *)subarrayToIndex:(NSUInteger)index {
    return [self subarrayWithRange:NSMakeRange(0, index+1)];
}

- (NSArray *)uniqueObjects {
    return [[NSOrderedSet orderedSetWithArray:self] array];
}

- (NSArray *)uniqueObjectsUsingEqualsBlock:(BOOL (^)(id, id))block {
    NSMutableArray *unique = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id right, NSUInteger idx, BOOL *stop) {
        __block BOOL ignore = NO;
        [unique enumerateObjectsUsingBlock:^(id left, NSUInteger idx, BOOL *stop) {
            if ((ignore = block(left, right))){
                *stop = YES;
            }
        }];
        if (!ignore) {
            [unique addObject:right];
        }
    }];
    return [NSArray arrayWithArray:unique];
}

@end