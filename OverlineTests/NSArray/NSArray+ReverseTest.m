//
//  Overline - NSArray+ReverseTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSArray+Reverse.h"

@interface NSArray_ReverseTest : SenTestCase
{
    
}
@end

@implementation NSArray_ReverseTest

- (void)testReverse
{
    assertThat([(@[@1, @2, @3]) reverse], equalTo(@[@3, @2, @1]));
}

- (void)testReversedArray
{
    assertThat([(@[@1, @2, @3]) reversedArray], equalTo(@[@3, @2, @1]));
}

@end
