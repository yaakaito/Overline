//
//  Overline - NSString+URLEncodeTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSString+OVURLEncode.h"

@interface NSString_URLEncodeTest : SenTestCase
{
    
}
@end

@implementation NSString_URLEncodeTest

- (void)testURLEncode {

    // FIXME: OCHamcrest assertions bug ?
    // assertThat([@"http://example.com/?query=value&list[]=hoge&list[]=fuga#!hashあ" URLEncode], equalTo(@"http%3A%2F%2Fexample%2Ecom%2F%3Fquery%3Dvalue%26list%5B%5D%3Dhoge%26list%5B%5D%3Dfuga%23%21hash%E3%81%82"));
    STAssertEqualObjects([@"http://example.com/?query=value&list[]=hoge&list[]=fuga#!hashあ" URLEncode], @"http%3A%2F%2Fexample%2Ecom%2F%3Fquery%3Dvalue%26list%5B%5D%3Dhoge%26list%5B%5D%3Dfuga%23%21hash%E3%81%82", @"URIEncode");
}

- (void)testStringByEncodingURL {

    STAssertEqualObjects([@"http://example.com/?query=value&list[]=hoge&list[]=fuga#!hashあ" stringByEncodingURL], @"http%3A%2F%2Fexample%2Ecom%2F%3Fquery%3Dvalue%26list%5B%5D%3Dhoge%26list%5B%5D%3Dfuga%23%21hash%E3%81%82", @"URIEncode");
}

- (void)testURLDecode {

    assertThat([@"http%3a%2f%2fexample%2ecom%2f%3fquery%3dvalue%26list%5b%5d%3dhoge%26list%5b%5d%3dfuga%23%21hash%e3%81%82" URLDecode], equalTo(@"http://example.com/?query=value&list[]=hoge&list[]=fuga#!hashあ"));
}

- (void)testStringByDecodingURL {

    assertThat([@"http%3a%2f%2fexample%2ecom%2f%3fquery%3dvalue%26list%5b%5d%3dhoge%26list%5b%5d%3dfuga%23%21hash%e3%81%82" stringByDecodingURL], equalTo(@"http://example.com/?query=value&list[]=hoge&list[]=fuga#!hashあ"));
}

@end
