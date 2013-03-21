//
// Created by yaakaito on 2013/03/22.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (Selector)
- (id)objectForKey:(id)aKey transformBlock:(id (^)(id obj))block;
@end