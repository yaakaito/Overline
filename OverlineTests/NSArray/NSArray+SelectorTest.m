//
//  NSArray+SelectorTest.m
//  Overline
//
//  Created by yaakaito on 12/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>samsa
#import "NSArray+OVSelector.h"
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface NSArray_SelectorTest : SenTestCase

@end

@implementation NSArray_SelectorTest

- (void)testFirstObject {
    assertThat([@[@"a"] firstObject], equalTo(@"a"));
    assertThat(([@[@"b", @"c", @"d"] firstObject]), equalTo(@"b"));
    assertThat(([@[@[@"a",@"b"], @[@"c", @"d"], @[@"e", @"f"]] firstObject]), equalTo(@[@"a", @"b"]));
}

@end
