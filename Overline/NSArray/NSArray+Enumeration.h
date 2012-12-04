//
// Created by yaakaito on 2012/12/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSArray (Enumeration)
- (void)each:(void (^)(id obj, NSUInteger idx))block;
- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block;
- (NSArray *)mappedArrayUsingBlock:(id (^)(id obj, NSUInteger idx))block;
@end