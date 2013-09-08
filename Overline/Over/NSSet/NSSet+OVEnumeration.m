//
// Created by yaakaito on 2013/01/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSSet+OVEnumeration.h"


@implementation NSSet (OVEnumeration)

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

- (id)reducedObjectByBlock:(id (^)(id, id))block memo:(id)memo {
    __block id reducedObject = memo;
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        reducedObject = block(reducedObject, obj);
    }];
    return reducedObject;
}

- (NSSet *)filteredSetUsingBlock:(BOOL (^)(id))block opposite:(BOOL)opposite {
    NSMutableSet *filteredSet = [NSMutableSet set];
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        BOOL r = block(obj);
        if (r == !opposite) {
            [filteredSet addObject:obj];
        }
    }];
    return filteredSet;
}

- (NSSet *)filteredSetUsingBlock:(BOOL (^)(id))block {
    return [self filteredSetUsingBlock:block opposite:NO];
}

- (NSSet *)rejectedSetUsingBlock:(BOOL (^)(id))block {
    return [self filteredSetUsingBlock:block opposite:YES];
}
@end