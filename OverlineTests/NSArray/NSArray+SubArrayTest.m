//
//  Overline - NSArray+SubArrayTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSArray+SubArray.h"

@interface NSArray_SubArrayTest : SenTestCase
{
    
}
@end

@implementation NSArray_SubArrayTest


- (void)testSubarrayFromIndex {
    NSArray *sub = [@[@1,@2,@3,@4,@5,@6] subarrayFromIndex:3];
    assertThat(sub, equalTo(@[@4,@5,@6]));
}

- (void)testSubarrayFromIndexLength {
    NSArray *sub = [@[@1,@2,@3,@4,@5,@6] subarrayFromIndex:3 length:2];
    assertThat(sub, equalTo(@[@4,@5]));
}

- (void)testSubarrayToIndex {
    NSArray *sub = [@[@1,@2,@3,@4,@5,@6] subarrayToIndex:3];
    assertThat(sub, equalTo(@[@1,@2,@3,@4]));
}
@end
