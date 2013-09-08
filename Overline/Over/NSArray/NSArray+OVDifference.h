//
// Created by kazuma.ukyo on 2/8/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSArray (OVDifference)
- (NSArray *)difference:(NSArray *)array;
- (NSArray *)arrayDifferenceWithArray:(NSArray *)array;
- (NSArray *)unionise:(NSArray *)array;
- (NSArray *)arrayByUnionisingArray:(NSArray *)array;
@end