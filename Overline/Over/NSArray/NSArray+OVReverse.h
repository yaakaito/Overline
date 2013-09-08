//
// Created by kazuma.ukyo on 2/8/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSArray (OVReverse)
- (NSArray *)reverse;
- (NSArray *)reversedArray;
- (NSArray *)objectAtReversedIndex:(NSUInteger)index;
@end