//
//  Overline - NSURL+ComponentsTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSURL+OVComponents.h"

@interface NSURL_ComponentsTest : SenTestCase
{
    
}
@end

@implementation NSURL_ComponentsTest

- (void)testQueryComponents
{
    NSURL *url = [NSURL URLWithString:@"http://example.com/?hoge=fuga&piyo=foo"];
    NSDictionary *actual = [url queryComponents];
    NSDictionary *expect = @{
            @"hoge" : @"fuga",
            @"piyo" : @"foo"
    };
    assertThat(actual, equalTo(expect));
}

@end
