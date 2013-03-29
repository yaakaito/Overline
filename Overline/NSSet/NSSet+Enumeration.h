//
// Created by yaakaito on 2013/01/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSSet (Enumeration)

#ifndef OV_NO_CONFLICT_BLOCKSKIT
- (void)each:(void (^)(id obj))block;
- (NSSet *)map:(id (^)(id obj))block;
- (NSSet *)filter:(BOOL (^)(id obj))block;
- (NSSet *)reject:(BOOL (^)(id obj))block;
- (id)reduce:(id (^)(id memo, id obj))block memo:(id)memo;
#endif

- (NSSet *)mappedSetUsingBlock:(id (^)(id obj))block;
- (id)reducedObjectByBlock:(id (^)(id memo, id obj))block memo:(id)memo;
- (NSSet *)filteredSetUsingBlock:(BOOL (^)(id obj))block;
- (NSSet *)rejectedSetUsingBlock:(BOOL (^)(id obj))block;
@end