//
//  Overline - NSArray+InitializeTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSArray+OVInitialize.h"

@interface NSArray_InitializeTest : SenTestCase
{
    
}
@end

@implementation NSArray_InitializeTest

- (void)testArrayWithRangeFromTo
{
    assertThat([NSArray arrayWithRangeFrom:0 to:10], equalTo(@[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9]));
    assertThat([NSArray arrayWithRangeFrom:-10 to:10], equalTo(@[@-10, @-9, @-8, @-7, @-6, @-5, @-4, @-3, @-2, @-1, @0, @1, @2, @3, @4, @5, @6, @7, @8, @9]));
    assertThat([NSArray arrayWithRangeFrom:0 to:-10], equalTo(@[@0, @-1, @-2, @-3, @-4, @-5, @-6, @-7, @-8, @-9]));
    assertThat([NSArray arrayWithRangeFrom:-5 to:0], equalTo(@[@-5, @-4, @-3, @-2, @-1]));
    assertThat([NSArray arrayWithRangeFrom:-5 to:-10], equalTo(@[@-5, @-6, @-7, @-8, @-9]));
}

- (void)testArrayWithRangeFromToStep
{
    assertThat([NSArray arrayWithRangeFrom:0 to:10 step:2], equalTo(@[@0, @2, @4, @6, @8]));
    assertThat([NSArray arrayWithRangeFrom:-10 to:0 step:2], equalTo(@[@-10, @-8, @-6, @-4, @-2]));
    assertThat([NSArray arrayWithRangeFrom:-5 to:0 step:2], equalTo(@[@-5, @-3, @-1]));
    assertThat([NSArray arrayWithRangeFrom:-5 to:-15 step:3], equalTo(@[@-5, @-8, @-11, @-14]));
}
@end
