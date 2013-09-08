//
//  Overline - NSDictionary+EnumerationTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSDictionary+OVEnumeration.h"
#import "NSDictionary+OVCore.h"
#import "NSString+OVRegularExpression.h"


@interface NSDictionary_EnumerationTest : SenTestCase
{
    
}
@end

@implementation NSDictionary_EnumerationTest

- (void)testEach {
    __block NSUInteger count = 0;
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3
    };

    [dic each:^(id obj, NSString *key) {
        assertThat(obj, equalTo([dic objectForKey:key]));
        count++;
    }];

    assertThatInteger(count, equalToInteger(3));
}

- (void)testMap {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *mapped = [dic map:^(id obj, NSString *key) {
        return @([obj integerValue] * 2);
    }];

    assertThat(mapped, equalTo(@{@"a":@2,@"b":@4,@"c":@6,@"d":@8}));
}

- (void)testMappedDictionary {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *mapped = [dic mappedDictionaryUsingBlock:^(id obj, NSString *key) {
        return @([obj integerValue] * 2);
    }];

    assertThat(mapped, equalTo(@{@"a":@2,@"b":@4,@"c":@6,@"d":@8}));
}

- (void)testArrayMap {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSArray *mapped = [dic mappedArrayUsingBlock:^(id obj, NSString *key) {
        return @([obj integerValue] * 2);
    }];

    assertThat([mapped sortedArrayUsingSelector:@selector(compare:)], equalTo(@[@2,@4,@6,@8]));
}


- (void)testFilterKey {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *filtered = [dic filterKey:^BOOL(NSString *key) {
        return [key isEqualToString:@"a"];
    }];
    assertThat(filtered, equalTo(@{@"a":@1}));
}

- (void)testDictionaryFilteredByKey {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *filtered = [dic dictionaryFilteredByKeyUsingBlock:^BOOL(NSString *key) {
        return [key isEqualToString:@"a"];
    }];
    assertThat(filtered, equalTo(@{@"a":@1}));
}

- (void)testRejectKey {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *rejected = [dic rejectKey:^BOOL(NSString *key) {
        return [key isEqualToString:@"a"];
    }];
    assertThat(rejected, equalTo(@{@"b":@2, @"c":@3, @"d":@4}));
}

- (void)testDictionaryRejectedByKey {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *rejected = [dic dictionaryRejectedByKeyUsingBlock:^BOOL(NSString *key) {
        return [key isEqualToString:@"a"];
    }];
    assertThat(rejected, equalTo(@{@"b":@2, @"c":@3, @"d":@4}));
}


- (void)testFilterObject{
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *filtered = [dic filterObject:^BOOL(id obj) {
        return [obj integerValue] == 1;
    }];
    assertThat(filtered, equalTo(@{@"a":@1}));
}

- (void)testDictionaryFilteredByObject {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *filtered = [dic dictionaryFilteredByObjectUsingBlock:^BOOL(id obj) {
        return [obj integerValue] == 1;
    }];
    assertThat(filtered, equalTo(@{@"a":@1}));
}

- (void)testRejectObject {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *rejected = [dic rejectObject:^BOOL(id obj) {
        return [obj integerValue] == 1;
    }];
    assertThat(rejected, equalTo(@{@"b":@2, @"c":@3, @"d":@4}));
}

- (void)testDictionaryRejectedByObject {
    NSDictionary *dic = @{
            @"a" : @1,
            @"b" : @2,
            @"c" : @3,
            @"d" : @4
    };

    NSDictionary *rejected = [dic dictionaryRejectedByObjectUsingBlock:^BOOL(id obj) {
        return [obj integerValue] == 1;
    }];
    assertThat(rejected, equalTo(@{@"b":@2, @"c":@3, @"d":@4}));
}

- (void)testMerge {
    NSDictionary *left = @{ @"left" : @"left-value" , @"ov" : @"left" };
    NSDictionary *right = @{ @"right" : @"right-value" , @"ov" : @"right"};
    NSDictionary *expect = @{
            @"left" : @"left-value",
            @"right" : @"right-value",
            @"ov" : @"right"
    };

    assertThat([left merge:right], equalTo(expect));
}

- (void)testDictionaryByMergingDictionary {
    NSDictionary *left = @{ @"left" : @"left-value" , @"ov" : @"left" };
    NSDictionary *right = @{ @"right" : @"right-value" , @"ov" : @"right"};
    NSDictionary *expect = @{
            @"left" : @"left-value",
            @"right" : @"right-value",
            @"ov" : @"right"
    };

    assertThat([left dictionaryByMergingDictionary:right], equalTo(expect));
}

- (void)testReduce {
    NSDictionary *dic = @{
            @"k1" : @"v1",
            @"k2" : @"k2"
    };

    NSString *actual = [dic reduce:^id(id memo, id obj, NSString *key) {
        return [memo stringByAppendingFormat:@"%@=%@", key, obj];
    } memo:@"hoge"];

    assertThat(actual, containsString(@"k1=v1"));
    assertThat(actual, containsString(@"k2=k2"));

    assertThatBool([@"hoge.{2}=.{2}.{2}=.{2}" testInString:actual], equalToBool(YES));
}

- (void)testReducedObjectUsingBlock {
    NSDictionary *dic = @{
            @"k1" : @"v1",
            @"k2" : @"k2"
    };

    NSString *actual = [dic reducedObjectUsingBlock:^id(id memo, id obj, NSString *key) {
        return [memo stringByAppendingFormat:@"%@=%@", key, obj];
    } memo:@"hoge"];

    assertThat(actual, containsString(@"k1=v1"));
    assertThat(actual, containsString(@"k2=k2"));

    assertThatBool([@"hoge.{2}=.{2}.{2}=.{2}" testInString:actual], equalToBool(YES));
}

- (void)testQueryString {
    NSDictionary *dic = @{
            @"k1" : @"v1",
            @"k2" : @"k2"
    };

    NSString *actual = [dic queryString];

    assertThat(actual, containsString(@"k1=v1"));
    assertThat(actual, containsString(@"k2=k2"));

    assertThatBool([@".{2}=.{2}&.{2}=.{2}" testInString:actual], equalToBool(YES));
}

- (void)testStringByFormattingQuery {
    NSDictionary *dic = @{
            @"k1" : @"v1",
            @"k2" : @"k2"
    };

    NSString *actual = [dic stringByFormattingQuery];

    assertThat(actual, containsString(@"k1=v1"));
    assertThat(actual, containsString(@"k2=k2"));

    assertThatBool([@".{2}=.{2}&.{2}=.{2}" testInString:actual], equalToBool(YES));
}
@end
