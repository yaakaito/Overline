//
// Created by yaakaito on 2013/01/10.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSArray (SubArray)
- (NSArray *)subarrayFromIndex:(NSUInteger)index;
- (NSArray *)subarrayFromIndex:(NSUInteger)index length:(NSUInteger)length;
- (NSArray *)subarrayToIndex:(NSUInteger)index;
- (NSArray *)uniqueObjects;
@end