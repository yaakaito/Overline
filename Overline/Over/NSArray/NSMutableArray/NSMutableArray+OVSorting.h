//
//  NSMutableArray+Sorting.h
//  Overline
//
//  Created by Hari Karam Singh on 06/08/2013.
//  Copyright (c) 2013 Overline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (OVSorting)

/** Sort the array according to compare: */
- (void)sortDescending:(BOOL)shouldBeDescending;

/** Shorthand for -sortDescending:NO */
- (void)sortAsc;

/** Shorthand for -sortDescending:YES */
- (void)sortDesc;

@end
