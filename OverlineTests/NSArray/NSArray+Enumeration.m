//
//  Overline - NSArray+Enumeration.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define OV_SHORTHAND
#import "NSArray+Enumeration.h"

@interface NSArray_Enumeration : SenTestCase
{
    
}
@end

@implementation NSArray_Enumeration

- (void)testEach
{
    __block NSUInteger lastIdx;
    [@[@"a", @"b", @"c"] each:^(id obj, NSUInteger idx) {
        assertThat(obj, equalTo([@[@"a", @"b", @"c"] objectAtIndex:idx]));
        lastIdx = idx;
    }];
    assertThat(@(lastIdx), equalTo(@2));
}

@end
