//
// Created by yaakaito on 2013/01/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSMutableArray+Shorthand.h"


@implementation NSMutableArray (Shorthand)
- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index
{
    [self insertObjects:objects atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, [objects count])]];
}
@end