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
@end