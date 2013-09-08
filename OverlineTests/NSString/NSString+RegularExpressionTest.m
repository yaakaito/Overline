//
//  Overline - NSString+RegularExpressionTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSString+OVRegularExpression.h"

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

- (void)testMatchesInString
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

- (void)testMatchesInStringOptions
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

    assertThatBool([@"https?" testInString:@"http://example.com"], equalToBool(YES));
    assertThatBool([@"https?" testInString:@"https://example.com"], equalToBool(YES));
}

- (void)testTestInStringOptions
{
    assertThatBool([@"hoge" testInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch], equalToBool(YES));
    assertThatBool([@"hoge" testInString:@"fuga-piyo-fuga" options:NSRegularExpressionSearch], equalToBool(NO));

    assertThatBool([@"h[0-9]ge" testInString:@"fuga-h0ge-fuga" options:NSRegularExpressionSearch], equalToBool(YES));
    assertThatBool([@"h[A-Z]ge" testInString:@"fuga-hoge-fuga" options:NSRegularExpressionSearch], equalToBool(NO));
}

- (void)testReplaceNewString
{
    assertThat([@"hoge" replace:@"ho" newString:@"fu"], equalTo(@"fuge"));
    assertThat([@"hoge" replace:@"h[a-z]" newString:@"fu"], equalTo(@"fuge"));
}

- (void)testStringByReplacingOccurrenceOfRegExpWithString
{
    assertThat([@"hoge" stringByReplacingOccurrencesOfRegExpPattern:@"ho" withString:@"fu"], equalTo(@"fuge"));
    assertThat([@"hoge" stringByReplacingOccurrencesOfRegExpPattern:@"h[a-z]" withString:@"fu"], equalTo(@"fuge"));
    assertThat([@"hoge fuga" stringByReplacingOccurrencesOfRegExpPattern:@"hoge" withString:@"fuga"], equalTo(@"fuga fuga"));
    assertThat([@"hoge and hoge" stringByReplacingOccurrencesOfRegExpPattern:@"hoge" withString:@"fuga"], equalTo(@"fuga and fuga"));
}

- (void)testReplaceNewStringOptions
{
    assertThat([@"HOGE" replace:@"ho" newString:@"fu" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuGE"));
    assertThat([@"HOGE" replace:@"h[A-Z]" newString:@"fu" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuGE"));
}

- (void)testStringByReplacingOccurrenceOfRegExpWithStringOptions
{
    assertThat([@"HOGE" stringByReplacingOccurrencesOfRegExpPattern:@"ho" withString:@"fu" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuGE"));
    assertThat([@"HOGE" stringByReplacingOccurrencesOfRegExpPattern:@"h[A-Z]" withString:@"fu" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuGE"));
    assertThat([@"hoGE fuga" stringByReplacingOccurrencesOfRegExpPattern:@"hoge" withString:@"fuga" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuga fuga"));
    assertThat([@"HOGE and hoge" stringByReplacingOccurrencesOfRegExpPattern:@"hoge" withString:@"fuga" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuga and fuga"));
}

- (void)testReplaceTemplate
{
    assertThat([@"hoge" replace:@"(.+)" withTemplate:@"$1"], equalTo(@"hoge"));
}

- (void)testStringByReplacingOccurrenceOfRegExpWithTemplate
{
    assertThat([@"hoge" stringByReplacingOccurrencesOfRegExpPattern:@"(.+)" withTemplate:@"$1"], equalTo(@"hoge"));
    assertThat([@"hoge fuga" stringByReplacingOccurrencesOfRegExpPattern:@"(hoge) (fuga)" withTemplate:@"$2 $1"], equalTo(@"fuga hoge"));
    assertThat([@"hoge and hoge" stringByReplacingOccurrencesOfRegExpPattern:@"(.+) and (.+)" withTemplate:@"$1 $2"], equalTo(@"hoge hoge"));
}

- (void)testReplaceTemplateOptions
{
    assertThat([@"HOGE" replace:@"(.+)" withTemplate:@"$1" options:NSRegularExpressionCaseInsensitive], equalTo(@"HOGE"));
}

- (void)testStringByReplacingOccurrenceOfRegExpWithTemplateOptions
{
    assertThat([@"hoge" stringByReplacingOccurrencesOfRegExpPattern:@"(.+)" withTemplate:@"$1" options:NSRegularExpressionCaseInsensitive], equalTo(@"hoge"));
    assertThat([@"hoge fuga" stringByReplacingOccurrencesOfRegExpPattern:@"(HOGE) (FUGA)" withTemplate:@"$2 $1" options:NSRegularExpressionCaseInsensitive], equalTo(@"fuga hoge"));
    assertThat([@"hoge and hoge" stringByReplacingOccurrencesOfRegExpPattern:@"(.+) and (.+)" withTemplate:@"$1 $2" options:NSRegularExpressionCaseInsensitive], equalTo(@"hoge hoge"));
}

@end
