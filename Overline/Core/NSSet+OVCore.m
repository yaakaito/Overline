//
// Created by kazuma.ukyo on 3/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSSet+OVCore.h"
#import "NSSet+OVEnumeration.h"

@implementation NSSet (OVCore)
- (void)each:(void (^)(id))block {
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        block(obj);
    }];
}

- (NSSet *)map:(id (^)(id))block {
    return [self mappedSetUsingBlock:block];
}

- (id)reduce:(id (^)(id, id))block memo:(id)memo {
    return [self reducedObjectByBlock:block memo:memo];
}

- (NSSet *)filter:(BOOL (^)(id))block {
    return [self filteredSetUsingBlock:block];
}

- (NSSet *)reject:(BOOL (^)(id))block {
    return [self rejectedSetUsingBlock:block];
}
@end