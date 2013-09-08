//
//  Overline - NSDictionary+SelectorTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSDictionary+OVSelector.h"

@interface NSDictionary_SelectorTest : SenTestCase
{
    NSDictionary *JSON;
}
@end

// {
//   "number" : 1,
//   "string" : "string",
//   "type" : 3,
//   "bool" : true,
//   "object" : {
//     "k" : "v"
//   },
//   "array" : [1,2,3],
//   "timestamp" : 1360000000,
//   "date8601" : "2013/01/01 12:24:36 +0900"
// }

static NSString *Dic_SelectorJSONString = @"{  \"number\" : 1,  \"string\" : \"string\",  \"type\" : 3,  \"bool\" : true,  \"object\" : {    \"k\" : \"v\"  },  \"array\" : [1,2,3],  \"timestamp\" : 1360000000,  \"date8601\" : \"2013/01/01 12:24:36 +0900\"}";

@implementation NSDictionary_SelectorTest


- (void)setUp {
    // Run before each test method
    JSON = [NSJSONSerialization JSONObjectWithData:[Dic_SelectorJSONString dataUsingEncoding:NSUTF8StringEncoding]
                                           options:NSJSONReadingAllowFragments
                                             error:nil];

}

- (void)tearDown {
    // Run after each test method
}

- (void)testObjectForKeyTransformBlock {
    NSDate *date = [JSON objectForKey:@"date8601" transformBlock:^id(id obj) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss Z"];
        return [formatter dateFromString:obj];
    }];
    assertThatLongLong([date timeIntervalSince1970], equalToLongLong(1357010676));
}

- (void)testStringForKey {

    assertThat([JSON stringForKey:@"string"], equalTo(@"string"));
}

- (void)testNumberForKey {

    assertThat([JSON numberForKey:@"number"], equalTo(@1));
}

- (void)testArrayForKey {

    assertThat([JSON arrayForKey:@"array"], equalTo(@[@1,@2,@3]));
}

- (void)testDictionaryForKey {
    assertThat([JSON dictionaryForKey:@"object"], equalTo(@{
            @"k" : @"v"
    }));
}

- (void)testDateForKey {
    NSDate *date = [JSON dateForKey:@"date8601"];
    assertThatLongLong([date timeIntervalSince1970], equalToLongLong(1357010676));
}

- (void)testDateForKeyUsingFormat {
    NSDate *date = [JSON dateForKey:@"date8601" usingFormat:@"yyyy/MM/dd HH:mm:ss Z"];
    assertThatLongLong([date timeIntervalSince1970], equalToLongLong(1357010676));
}

- (void)testDateWithTimestampForKey {
    NSDate *date = [JSON timestampForKey:@"timestamp"];
    assertThat(date, equalTo([NSDate dateWithTimeIntervalSince1970:1360000000]));
}

- (void)testBoolObjectWithTrueValue {
    assertThatBool([[JSON boolObjectForKey:@"type" withTrueValue:@3] boolValue], equalToBool(YES));
}


- (void)testBoolWithTrueValue {
    assertThatBool([JSON boolForKey:@"type" withTureValue:@3], equalToBool(YES));
}

- (void)testBool {
    assertThatBool([@{@"k" : @YES} boolForKey:@"k"], equalToBool(YES));
}

- (void)testInt {

    assertThatInt([@{@"k" : @2} intForKey:@"k"], equalToInt(2));
}

- (void)testInteger {

    assertThatInteger([@{@"k" : @2147483647} integerForKey:@"k"], equalToInteger(2147483647));
}

- (void)testUnsignedInt {

    assertThatUnsignedInt([@{@"k" : @2} unsignedIntForKey:@"k"], equalToUnsignedInt(2));
}

- (void)testUnsignedInteger {

    assertThatUnsignedInteger([@{@"k" : @4294967295} unsignedIntegerForKey:@"k"], equalToUnsignedInteger(4294967295));
}

- (void)testLong {

    assertThatLong([@{@"k" : @2147483647} longForKey:@"k"], equalToLong(2147483647));
}

- (void)testUnsignedLong {

    assertThatUnsignedLong([@{@"k" : @4294967295} unsignedLongForKey:@"k"], equalToUnsignedLong(4294967295));
}

- (void)testLongLong {

    assertThatLongLong([@{@"k" : @9223372036854775807} longLongForKey:@"k"], equalToLongLong(9223372036854775807));
}

- (void)testUnsignedLongLong {

    assertThatUnsignedLongLong([@{@"k" : @18446744073709551615} unsignedLongLongForKey:@"k"], equalToUnsignedLongLong(18446744073709551615));
}

- (void)testDouble {

    assertThatDouble([@{@"k" : @0.5} doubleForKey:@"k"], equalToDouble(0.5));
}

- (void)testFloat {

    assertThatFloat([@{@"k" : @0.5} floatForKey:@"k"], equalToFloat(0.5));
}


@end
