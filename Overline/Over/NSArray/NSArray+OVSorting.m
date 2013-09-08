//
//  NSArray+Sorting.m
//  Overline
//
//  Created by Hari Karam Singh on 06/08/2013.
//  Copyright (c) 2013 Overline. All rights reserved.
//

#import "NSArray+OVSorting.h"

@implementation NSArray (Sorting)

- (NSArray *)arraySortedDescending:(BOOL)shouldBeDescending
{
    return [self sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSComparisonResult res = [obj1 compare:obj2];
        
        if (shouldBeDescending) {
            if (res == NSOrderedAscending) res = NSOrderedDescending;
            else if (res == NSOrderedDescending) res = NSOrderedAscending;
        }
        
        return res;
    }];
}


- (NSArray *)arraySortedAsc
{
    return [self arraySortedDescending:NO];
}


- (NSArray *)arraySortedDesc
{
    return [self arraySortedDescending:YES];
}

@end
