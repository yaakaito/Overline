//
//  Overline - NSArray+SubArrayTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSArray+OVSubArray.h"

@interface NSArray_SubArrayTest : SenTestCase
{
    
}
@end

@implementation NSArray_SubArrayTest


- (void)testSubarrayFromIndex {
    NSArray *sub = [@[@1,@2,@3,@4,@5,@6] subarrayFromIndex:3];
    assertThat(sub, equalTo(@[@4,@5,@6]));
}

- (void)testSubarrayFromIndexLength {
    NSArray *sub = [@[@1,@2,@3,@4,@5,@6] subarrayFromIndex:3 length:2];
    assertThat(sub, equalTo(@[@4,@5]));
}

- (void)testSubarrayToIndex {
    NSArray *sub = [@[@1,@2,@3,@4,@5,@6] subarrayToIndex:3];
    assertThat(sub, equalTo(@[@1,@2,@3,@4]));
}

- (void)testUniqueObjects {
    NSArray *uniqueObjects = [@[@1, @2, @3, @1, @3, @4, @5] uniqueObjects];
    assertThat(uniqueObjects, equalTo(@[@1, @2, @3, @4, @5]));
}

- (void)testUniqueObjectsUsingEqualsBlock {

    NSArray *uniqueObjects = [@[@{
            @"name" : @"1",
            @"value" : @"aaa"
    }, @{
            @"name" : @"2",
            @"value" : @"bbb"
    }, @{
            @"name" : @"3",
            @"value" : @"aaa"
    }, @{
            @"name" : @"4",
            @"value" : @"ccc"
    }, @{
            @"name" : @"5",
            @"value" : @"ccc"
    }, @{
            @"name" : @"6",
            @"value" : @"ddd"
    }] uniqueObjectsUsingEqualsBlock:^BOOL(id left, id right) {
        return [[left objectForKey:@"value"] isEqual:[right objectForKey:@"value"]];
    }];

    assertThat(uniqueObjects, equalTo(@[@{
            @"name" : @"1",
            @"value" : @"aaa"
    }, @{
            @"name" : @"2",
            @"value" : @"bbb"
    }, @{
            @"name" : @"4",
            @"value" : @"ccc"
    } , @{
            @"name" : @"6",
            @"value" : @"ddd"
    }]));
}
@end
