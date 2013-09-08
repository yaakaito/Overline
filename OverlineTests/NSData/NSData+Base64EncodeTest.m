//
//  Overline - NSData+Base64EncodeTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSData+OVBase64Encode.h"


@interface NSData_Base64EncodeTest : SenTestCase
{
    
}
@end

@implementation NSData_Base64EncodeTest

- (void)testBase64Encode {
    NSData *data = [@"a" dataUsingEncoding:NSUTF8StringEncoding];
    assertThat([data base64Encode], equalTo(@"YQ=="));
}

- (void)testStringByEncoding {
    NSData *data = [@"a" dataUsingEncoding:NSUTF8StringEncoding];
    assertThat([data stringUsingEncodingBase64], equalTo(@"YQ=="));
}
@end
