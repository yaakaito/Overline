//
//  Overline - NSBundle+ShorthandTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSBundle+OVShorthand.h"

@interface NSBundle_ShorthandTest : SenTestCase
{
    
}
@end

@implementation NSBundle_ShorthandTest

- (void)testJSONForResourceName {
    id JSON = [[NSBundle bundleForClass:[self class]] JSONForResourceName:@"test_json"];
    assertThat(JSON, equalTo(@{@"hoge":@"fuga"}));
}

@end
