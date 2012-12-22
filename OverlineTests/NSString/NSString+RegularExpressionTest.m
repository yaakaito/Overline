//
//  Overline - NSString+RegularExpressionTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSString+RegularExpression.h"

@interface NSString_RegularExpressionTest : SenTestCase
{
    
}
@end

@implementation NSString_RegularExpressionTest


- (void)testRangeOfFirstMatchInString
{
    NSRange range = [@"hoge" rangeOfFirstMatchInString:@"fuga-hoge-fuga"];
    assertThatInteger(range.location, equalToInteger(5));
    assertThatInteger(range.length, equalToInteger(4));

    range = [@"h[0-9]ge" rangeOfFirstMatchInString:@"fuga-hoge-h0ge-fuga"];
    assertThatInteger(range.location, equalToInteger(10));
    assertThatInteger(range.length, equalToInteger(4));

    range = [@"h[A-Z]ge" rangeOfFirstMatchInString:@"fuga-hoge-fuga"];
    assertThatInteger(range.location, equalToInteger(NSNotFound));
}

- (void)testRangeOfFirstMatchInStringOptions
{
    NSRange range = [@"hoge" rangeOfFirstMatchInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch];
    assertThatInteger(range.location, equalToInteger(5));
    assertThatInteger(range.length, equalToInteger(4));

    range = [@"h[0-9]ge" rangeOfFirstMatchInString:@"fuga-hoge-h0ge-fuga" options:NSRegularExpressionSearch];
    assertThatInteger(range.location, equalToInteger(10));
    assertThatInteger(range.length, equalToInteger(4));

    range = [@"h[A-Z]ge" rangeOfFirstMatchInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch];
    assertThatInteger(range.location, equalToInteger(NSNotFound));
}

- (void)testMacthesInString
{
    NSArray *matches = [@"hoge" matchesInString:@"hoge-fuga-hoge"];
    assertThatInteger([matches count], equalToInteger(2));
    assertThat(matches, equalTo(@[@"hoge", @"hoge"]));

    matches = [@"h[0-9]ge" matchesInString:@"hoge-fuga-h0ge"];
    assertThatInteger([matches count], equalToInteger(1));
    assertThat(matches, equalTo(@[@"h0ge"]));

    matches = [@"h[A-Z]ge" matchesInString:@"fuga-hoge-fuga"];
    assertThatInteger([matches count], equalToInteger(0));
}

- (void)testMacthesInStringOptions
{
    NSArray *matches = [@"hoge" matchesInString:@"hoge-fuga-hoge" options:NSRegularExpressionSearch];
    assertThatInteger([matches count], equalToInteger(2));
    assertThat(matches, equalTo(@[@"hoge", @"hoge"]));

    matches = [@"h[0-9]ge" matchesInString:@"hoge-fuga-h0ge" options:NSRegularExpressionSearch];
    assertThatInteger([matches count], equalToInteger(1));
    assertThat(matches, equalTo(@[@"h0ge"]));

    matches = [@"h[A-Z]ge" matchesInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch];
    assertThatInteger([matches count], equalToInteger(0));
}

- (void)testTestInString
{
    assertThatBool([@"hoge" testInString:@"fuga-hoge-fuga"], equalToBool(YES));
    assertThatBool([@"hoge" testInString:@"fuga-piyo-fuga"], equalToBool(NO));

    assertThatBool([@"h[0-9]ge" testInString:@"fuga-h0ge-fuga"], equalToBool(YES));
    assertThatBool([@"h[A-Z]ge" testInString:@"fuga-hoge-fuga"], equalToBool(NO));
}

- (void)testTestInStringOptions
{
    assertThatBool([@"hoge" testInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch], equalToBool(YES));
    assertThatBool([@"hoge" testInString:@"fuga-piyo-fuga" options:NSRegularExpressionSearch], equalToBool(NO));

    assertThatBool([@"h[0-9]ge" testInString:@"fuga-h0ge-fuga" options:NSRegularExpressionSearch], equalToBool(YES));
    assertThatBool([@"h[A-Z]ge" testInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch], equalToBool(NO));
}
@end
