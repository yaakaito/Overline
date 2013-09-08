//
//  Overline - NSString+JSONTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSString+OVJSON.h"

@interface NSString_JSONTest : SenTestCase
{
    
}
@end

@implementation NSString_JSONTest

- (void)testJSON {
    NSString *JSONString = @"{\"hoge\" : \"fuga\" }";
    id json = [JSONString JSON];

    assertThat(json, equalTo(@{ @"hoge" : @"fuga"}));

    JSONString = @"{\"}";
    json = [JSONString JSON];

    assertThat(json, equalTo(nil));
}

- (void)testJsonObject {
    NSString *JSONString = @"{\"hoge\" : \"fuga\" }";
    id json = [JSONString jsonObject];

    assertThat(json, equalTo(@{ @"hoge" : @"fuga"}));

    JSONString = @"{\"}";
    json = [JSONString jsonObject];

    assertThat(json, equalTo(nil));
}
@end
