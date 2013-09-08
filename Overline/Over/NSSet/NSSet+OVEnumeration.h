//
// Created by yaakaito on 2013/01/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSSet (OVEnumeration)

- (NSSet *)mappedSetUsingBlock:(id (^)(id obj))block;
- (id)reducedObjectByBlock:(id (^)(id memo, id obj))block memo:(id)memo;
- (NSSet *)filteredSetUsingBlock:(BOOL (^)(id obj))block;
- (NSSet *)rejectedSetUsingBlock:(BOOL (^)(id obj))block;
@end