//
// Created by kazuma.ukyo on 3/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+OVCore.h"
#import "NSArray+OVEnumeration.h"

@implementation NSArray (OVCore)

- (void)each:(void (^)(id, NSUInteger))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)map:(id (^)(id, NSUInteger))block {
    return [self mappedArrayUsingBlock:block];
}

- (id)reduce:(id (^)(id, id))block memo:(id)memo {
    return [self reducedObjectByBlock:block memo:memo];
}

- (NSArray *)filter:(BOOL (^)(id, NSUInteger))block {
    return [self filteredArrayUsingBlock:block];
}

- (NSArray *)reject:(BOOL (^)(id, NSUInteger))block {
    return [self rejectedArrayUsingBlock:block];
}

@end