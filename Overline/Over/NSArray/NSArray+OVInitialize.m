//
// Created by kazuma.ukyo on 2/8/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+OVInitialize.h"
#import "NSArray+OVReverse.h"


@implementation NSArray (OVInitialize)

+ (instancetype)_arrayWithRangeFrom:(NSInteger)from to:(NSInteger)to step:(NSUInteger)step reverse:(BOOL)reverse {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = from; i < to; i += step) {
        [array addObject:[NSNumber numberWithInteger:i]];
    }

    if (reverse) {
        return [array reversedArray];
    }

    return [NSArray arrayWithArray:array];
}

+ (instancetype)arrayWithRangeFrom:(NSInteger)from to:(NSInteger)to {
    return [self.class arrayWithRangeFrom:from to:to step:1];
}

+ (instancetype)arrayWithRangeFrom:(NSInteger)from to:(NSInteger)to step:(NSUInteger)step {
    if (from > to) {
        // reverse
        return [self.class _arrayWithRangeFrom:to + 1 to:from + 1 step:step reverse:YES];
    }

    return [self.class _arrayWithRangeFrom:from to:to step:step reverse:NO];
}


@end