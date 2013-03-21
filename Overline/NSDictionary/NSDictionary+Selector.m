//
// Created by yaakaito on 2013/03/22.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDictionary+Selector.h"


@implementation NSDictionary (Selector)

- (id)objectForKey:(id)aKey transformBlock:(id (^)(id))block {
    return block([self objectForKey:aKey]);
}

- (NSNumber *)numberForKey:(id)aKey {
    return (NSNumber *)[self objectForKey:aKey];
}

- (NSString *)stringForKey:(id)aKey {
    return (NSString *)[self objectForKey:aKey];
}

- (NSArray *)arrayForKey:(id)aKey {
    return (NSArray *)[self objectForKey:aKey];
}

- (NSDictionary *)dictionaryForKey:(id)aKey {
    return (NSDictionary *)[self objectForKey:aKey];
}

- (NSDate *)dateForKey:(id)aKey {
    return [self dateForKey:aKey usingFormat:@"yyyy/MM/dd HH:mm:ss Z"];
}

- (NSDate *)dateForKey:(id)aKey usingFormat:(NSString *)formatString {
    return [self objectForKey:aKey transformBlock:^id(id obj) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:formatString];
        return [formatter dateFromString:obj];
    }];
}

- (int)intForKey:(id)aKey {
    return [[self objectForKey:aKey] intValue];
}

- (NSInteger)integerForKey:(id)aKey {
    return [[self objectForKey:aKey] integerValue];
}

- (unsigned int)unsignedIntForKey:(id)aKey {
    return [[self objectForKey:aKey] unsignedIntValue];
}

- (NSUInteger)unsignedIntegerForKey:(id)aKey {
    return [[self objectForKey:aKey] unsignedIntegerValue];
}

- (long)longForKey:(id)aKey {
    return [[self objectForKey:aKey] longValue];
}

- (unsigned long)unsignedLongForKey:(id)aKey {
    return [[self objectForKey:aKey] unsignedLongValue];
}

- (long long)longLongForKey:(id)aKey {
    return [[self objectForKey:aKey] longLongValue];
}

- (unsigned long long int)unsignedLongLongForKey:(id)aKey {
    return [[self objectForKey:aKey] unsignedLongLongValue];
}

- (double)doubleForKey:(id)aKey {
    return [[self objectForKey:aKey] doubleValue];
}

- (float)floatForKey:(id)aKey {
    return [[self objectForKey:aKey] floatValue];
}
@end