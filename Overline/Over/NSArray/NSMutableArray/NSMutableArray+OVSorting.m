//
//  NSMutableArray+Sorting.m
//  Overline
//
//  Created by Hari Karam Singh on 06/08/2013.
//  Copyright (c) 2013 Overline. All rights reserved.
//

#import "NSMutableArray+OVSorting.h"

@implementation NSMutableArray (Sorting)

- (void)sortDescending:(BOOL)shouldBeDescending
{

    [self sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSComparisonResult res = [obj1 compare:obj2];
        
        if (shouldBeDescending) {
            if (res == NSOrderedAscending) res = NSOrderedDescending;
            else if (res == NSOrderedDescending) res = NSOrderedAscending;
        }
        
        return res;
    }];
}


- (void)sortAsc
{
    [self sortDescending:NO];
}


- (void)sortDesc
{
    [self sortDescending:YES];
}

@end
