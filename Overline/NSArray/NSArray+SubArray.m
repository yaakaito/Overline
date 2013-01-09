//
// Created by yaakaito on 2013/01/10.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+SubArray.h"


@implementation NSArray (SubArray)

- (NSArray *)subarrayFromIndex:(NSUInteger)index {
    return [self subarrayFromIndex:index length:[self count] - index];
}

- (NSArray *)subarrayFromIndex:(NSUInteger)index length:(NSUInteger)length {
    return [self subarrayWithRange:NSMakeRange(index, length)];
}

- (NSArray *)subarrayToIndex:(NSUInteger)index {
    return [self subarrayWithRange:NSMakeRange(0, index+1)];
}

@end