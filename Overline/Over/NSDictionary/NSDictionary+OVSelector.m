//
// Created by yaakaito on 2013/03/22.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDictionary+OVSelector.h"


@implementation NSDictionary (OVSelector)

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

- (NSDate *)since1970DateForKey:(NSString *)aKey {
    return [NSDate dateWithTimeIntervalSince1970:[self doubleForKey:aKey]];
}

- (NSDate *)timestampForKey:(NSString *)aKey {
    return [self since1970DateForKey:aKey];
}

- (NSNumber *)boolObjectForKey:(NSString *)aKey withTrueValue:(id)value {
    return [self objectForKey:aKey transformBlock:^id(id obj) {
        if ([value isEqual:obj]) {
            return [NSNumber numberWithBool:YES];
        }
        return [NSNumber numberWithBool:NO];
    }];
}

- (BOOL)boolForKey:(id)aKey withTureValue:(id)value {
    return [[self boolObjectForKey:aKey withTrueValue:value] boolValue];
}

- (BOOL)boolForKey:(id)aKey {
    return [[self objectForKey:aKey] boolValue];
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