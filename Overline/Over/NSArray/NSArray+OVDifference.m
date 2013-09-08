//
// Created by kazuma.ukyo on 2/8/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+OVDifference.h"


@implementation NSArray (OVDifference)

- (NSArray *)difference:(NSArray *)array {
    return [self arrayDifferenceWithArray:array];
}

- (NSArray *)arrayDifferenceWithArray:(NSArray *)array {
    NSMutableOrderedSet *all = [NSMutableOrderedSet orderedSetWithArray:[self arrayByAddingObjectsFromArray:array]];
    NSMutableOrderedSet *dup = [NSMutableOrderedSet orderedSetWithArray:self];
    [dup intersectOrderedSet:[NSOrderedSet orderedSetWithArray:array]];
    [all minusOrderedSet:dup];
    return [all array];
}

- (NSArray *)unionise:(NSArray *)array {
    return [self arrayByUnionisingArray:array];
}

- (NSArray *)arrayByUnionisingArray:(NSArray *)array {
    NSMutableOrderedSet *base = [NSMutableOrderedSet orderedSetWithArray:self];
    [base unionOrderedSet:[NSOrderedSet orderedSetWithArray:array]];
    return [base array];
}
@end