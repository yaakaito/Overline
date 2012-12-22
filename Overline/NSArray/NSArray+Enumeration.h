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
- (id)reduce:(id (^)(id memo, id obj))block memo:(id)memo;
- (id)reducedObjectByBlock:(id (^)(id memo, id obj))block memo:(id)memo;
- (id)find:(BOOL (^)(id obj, NSUInteger idx))block;
- (id)objectUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)filter:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)filteredArrayUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)reject:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)rejectedArrayUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;
@end