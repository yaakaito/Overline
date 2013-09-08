//
//  Overline - NSString+Base64EncodeTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSString+OVBase64Encode.h"

@interface NSString_Base64EncodeTest : SenTestCase
{
    
}
@end

@implementation NSString_Base64EncodeTest

- (void)testEncodeBase64 {
    assertThat([@"a" encodeBase64], equalTo(@"YQ=="));
    assertThat([@"hogehoge" encodeBase64], equalTo(@"aG9nZWhvZ2U="));
    assertThat([@"あいうえお" encodeBase64], equalTo(@"44GC44GE44GG44GI44GK"));
}

- (void)testStringByEncodingBase64 {
    assertThat([@"a" stringByEncodingBase64], equalTo(@"YQ=="));
    assertThat([@"hogehoge" stringByEncodingBase64], equalTo(@"aG9nZWhvZ2U="));
    assertThat([@"あいうえお" stringByEncodingBase64], equalTo(@"44GC44GE44GG44GI44GK"));
}

- (void)testDecodeBase64 {
    assertThat([@"YQ==" decodeBase64], equalTo(@"a"));
    assertThat([@"aG9nZWhvZ2U=" decodeBase64], equalTo(@"hogehoge"));
    assertThat([@"44GC44GE44GG44GI44GK" decodeBase64], equalTo(@"あいうえお"));
}

- (void)testStringByDecodingBase64 {
    assertThat([@"YQ==" stringByDecodingBase64], equalTo(@"a"));
    assertThat([@"aG9nZWhvZ2U=" stringByDecodingBase64], equalTo(@"hogehoge"));
    assertThat([@"44GC44GE44GG44GI44GK" stringByDecodingBase64], equalTo(@"あいうえお"));
}

- (void)testDataByDecodingBase64 {
    NSData *data = [@"44GC44GE44GG44GI44GK" dataUsingDecodingBase64];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    assertThat(str, equalTo(@"あいうえお"));
}

@end
