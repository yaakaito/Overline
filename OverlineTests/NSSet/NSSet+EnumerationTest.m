//
//  Overline - NSSet+EnumerationTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSSet+Enumeration.h"
#import "NSString+RegularExpression.h"

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

}

- (void)testReducedObjectByBlock {

}

- (void)testFind {

}

- (void)testObjectUsingBlock {

}

- (void)testFilter {

}

- (void)testFilteredSetUsingBlock {

}

- (void)testReject {

}

- (void)testRejectedSetUsingBlock {

}
@end
