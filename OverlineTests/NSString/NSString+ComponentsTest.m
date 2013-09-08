//
//  Overline - NSString+ComponentsTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSString+OVComponents.h"

@interface NSString_ComponentsTest : SenTestCase
{
    
}
@end

@implementation NSString_ComponentsTest

- (void)testComponentsByInnerAndOuter
{
    NSString *base = @"hoge=fuga&piyo=foo";
    NSDictionary *actual = [base componentsSeparatedByInnerString:@"=" andOuterString:@"&"];
    NSDictionary *expect = @{
            @"hoge" : @"fuga",
            @"piyo" : @"foo"
    };
    assertThat(actual, equalTo(expect));
}

@end
