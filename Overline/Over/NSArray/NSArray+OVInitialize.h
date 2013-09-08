//
// Created by kazuma.ukyo on 2/8/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSArray (OVInitialize)
+ (instancetype)arrayWithRangeFrom:(NSInteger)from to:(NSInteger)to;
+ (instancetype)arrayWithRangeFrom:(NSInteger)from to:(NSInteger)to step:(NSUInteger)step;
@end