//
// Created by yaakaito on 2012/12/24.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDictionary+OVEnumeration.h"

@implementation NSDictionary (OVEnumeration)

- (NSDictionary *)mappedDictionaryUsingBlock:(id (^)(id, NSString *))block {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id o = block(obj, key);
        if (o) {
            [result setValue:o forKey:key];
        }
    }];
    return result;
}

- (NSArray *)arrayMap:(id (^)(id, NSString *))block {
    return [self mappedArrayUsingBlock:block];
}

- (NSArray *)mappedArrayUsingBlock:(id (^)(id, NSString *))block {
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id o = block(obj, key);
        if (o) {
            [result addObject:o];
        }
    }];
    return result;
}

- (NSDictionary *)filteredDictionaryUsingBlock:(BOOL (^)(id key, id obj))block opposite:(BOOL)opposite {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        BOOL r = block(key, obj);
        if (r == !opposite) {
            [result setObject:obj forKey:key];
        }
    }];
    return result;
}

- (NSDictionary *)filterKey:(BOOL (^)(NSString *))block {
    return [self dictionaryFilteredByKeyUsingBlock:block];
}

- (NSDictionary *)dictionaryFilteredByKeyUsingBlock:(BOOL (^)(NSString *))block {
    return [self filteredDictionaryUsingBlock:^BOOL(id key, id obj) {
        return block(key);
    } opposite:NO];
}

- (NSDictionary *)rejectKey:(BOOL (^)(NSString *))block {
    return [self dictionaryRejectedByKeyUsingBlock:block];
}

- (NSDictionary *)dictionaryRejectedByKeyUsingBlock:(BOOL (^)(NSString *))block {
    return [self filteredDictionaryUsingBlock:^BOOL(id key, id obj) {
        return block(key);
    } opposite:YES];
}

- (NSDictionary *)filterObject:(BOOL (^)(id))block {
    return [self dictionaryFilteredByObjectUsingBlock:block];
}

- (NSDictionary *)dictionaryFilteredByObjectUsingBlock:(BOOL (^)(id))block {
    return [self filteredDictionaryUsingBlock:^BOOL(id key, id obj) {
        return block(obj);
    } opposite:NO];
}

- (NSDictionary *)rejectObject:(BOOL (^)(id))block {
    return [self dictionaryRejectedByObjectUsingBlock:block];
}

- (NSDictionary *)dictionaryRejectedByObjectUsingBlock:(BOOL (^)(id))block {
    return [self filteredDictionaryUsingBlock:^BOOL(id key, id obj) {
        return block(obj);
    } opposite:YES];
}

- (NSDictionary *)merge:(NSDictionary *)dictionary {
    return [self dictionaryByMergingDictionary:dictionary];
}

- (NSDictionary *)dictionaryByMergingDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *that = [self mutableCopy];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [that setValue:obj forKey:key];
    }];
    return that;
}

- (id)reducedObjectUsingBlock:(id (^)(id, id, NSString *))block memo:(id)memo {
    __block id reduceObject = memo;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        reduceObject = block(reduceObject, obj, key);
    }];
    return reduceObject;
}

- (NSString *)queryString {
    return [self stringByFormattingQuery];
}

- (NSString *)stringByFormattingQuery {
    return [self reducedObjectUsingBlock:^id(id memo, id obj, NSString *key) {
        if ([memo length] > 0) {
            return [memo stringByAppendingString:[NSString stringWithFormat:@"&%@=%@", key, obj]];
        }
        return [memo stringByAppendingString:[NSString stringWithFormat:@"%@=%@", key, obj]];
    } memo:@""];
}
@end