//
//  NSArray+Sorting.h
//  Overline
//
//  Created by Hari Karam Singh on 06/08/2013.
//  Copyright (c) 2013 Overline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (OVSorting)

/** Return the array sorted according to compare: */
- (NSArray *)arraySortedDescending:(BOOL)shouldBeDescending;

/** Shorthand for -arraySortedDescending:NO */
- (NSArray *)arraySortedAsc;

/** Shorthand for -arraySortedDescending:YES */
- (NSArray *)arraySortedDesc;

@end
