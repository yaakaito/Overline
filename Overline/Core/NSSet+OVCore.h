//
// Created by kazuma.ukyo on 3/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSSet (OVCore)
- (void)each:(void (^)(id obj))block;
- (NSSet *)map:(id (^)(id obj))block;
- (NSSet *)filter:(BOOL (^)(id obj))block;
- (NSSet *)reject:(BOOL (^)(id obj))block;
- (id)reduce:(id (^)(id memo, id obj))block memo:(id)memo;

@end