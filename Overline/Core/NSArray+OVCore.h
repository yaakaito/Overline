//
// Created by kazuma.ukyo on 3/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSArray (OVCore)
- (void)each:(void (^)(id obj, NSUInteger idx))block;
- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block;
- (id)reduce:(id (^)(id memo, id obj))block memo:(id)memo;
- (NSArray *)filter:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)reject:(BOOL (^)(id obj, NSUInteger idx))block;
@end