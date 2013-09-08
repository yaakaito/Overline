//
//  Overline - NSSet+EnumerationTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSSet+OVEnumeration.h"
#import "NSString+OVRegularExpression.h"
#import "NSSet+OVCore.h"

@interface NSSet_EnumerationTest : SenTestCase
{
    
}
@end

@implementation NSSet_EnumerationTest

- (void)testEach {
    __block NSUInteger count = 0;
    NSSet *set = [NSSet setWithArray:@[@"A", @"B", @"C"]];
    [set each:^(id obj) {
        assertThatBool([@"^[ABC]$" testInString:obj], equalToBool(YES));
        count++;
    }];
}

- (void)testMap {
    NSSet *set = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    NSSet *mapped = [set map:^id(id obj) {
        if ([obj integerValue] % 2 == 0){
            return obj;
        }
        return nil;
    }];

    NSArray *ary = [[mapped allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (NSComparisonResult)([obj1 integerValue] - [obj2 integerValue]);
    }];

    assertThat(ary, equalTo(@[@2,@4,@6]));
}



- (void)testMappedSetUsingBlock {
    NSSet *set = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    NSSet *mapped = [set mappedSetUsingBlock:^id(id obj) {
        if ([obj integerValue] % 2 == 0){
            return obj;
        }
        return nil;
    }];

    NSArray *ary = [[mapped allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (NSComparisonResult)([obj1 integerValue] - [obj2 integerValue]);
    }];

    assertThat(ary, equalTo(@[@2,@4,@6]));
}

- (void)testReduce {
    NSSet *set = [NSSet setWithArray:@[@1,@2,@3]];
    id obj = [set reduce:^id(id memo, id obj) {
        return @([memo integerValue] + [obj integerValue]);
    } memo:@0];
    assertThat(obj, equalTo(@6));
}

- (void)testReducedObjectByBlock {
    NSSet *set = [NSSet setWithArray:@[@1,@2,@3]];
    id obj = [set reducedObjectByBlock:^id(id memo, id obj) {
        return @([memo integerValue] + [obj integerValue]);
    } memo:@0];
    assertThat(obj, equalTo(@6));
}

- (void)testFilter {
    NSSet *set = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    NSSet *filtered = [set filter:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    NSArray *ary = [[filtered allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (NSComparisonResult)([obj1 integerValue] - [obj2 integerValue]);
    }];

    assertThat(ary, equalTo(@[@2,@4,@6]));
}

- (void)testFilteredSetUsingBlock {
    NSSet *set = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    NSSet *filtered = [set filteredSetUsingBlock:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    NSArray *ary = [[filtered allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (NSComparisonResult)([obj1 integerValue] - [obj2 integerValue]);
    }];

    assertThat(ary, equalTo(@[@2,@4,@6]));

}

- (void)testReject {
    NSSet *set = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    NSSet *rejected = [set reject:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    NSArray *ary = [[rejected allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (NSComparisonResult)([obj1 integerValue] - [obj2 integerValue]);
    }];

    assertThat(ary, equalTo(@[@1,@3,@5]));
}

- (void)testRejectedSetUsingBlock {
    NSSet *set = [NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]];
    NSSet *rejected = [set rejectedSetUsingBlock:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    NSArray *ary = [[rejected allObjects] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (NSComparisonResult)([obj1 integerValue] - [obj2 integerValue]);
    }];

    assertThat(ary, equalTo(@[@1,@3,@5]));
}
@end
