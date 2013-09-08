//
//  Overline - NSArray+RandomTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSArray+OVRandom.h"

@interface NSArray_RandomTest : SenTestCase
{
    
}
@end

@implementation NSArray_RandomTest


- (void)testShuffle {
    NSArray *shuffled = [@[@1,@2,@3,@4,@5,@6] shuffle];
    assertThat(@([shuffled count]), equalTo(@6));
    [SenTestLog testLogWithFormat:@"%@", shuffled];
}

- (void)testShuffledArray {
    NSArray *shuffled = [@[@1,@2,@3,@4,@5,@6] shuffledArray];
    assertThat(@([shuffled count]), equalTo(@6));
    [SenTestLog testLogWithFormat:@"%@", shuffled];
}

- (void)testAnyObject {
    NSArray *array = @[@1, @2, @3];

    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
}

- (void)testAnyObjectWithEmptyArray {
  NSArray *array = @[];

  assertThatBool([array anyObject] == nil, equalToBool(YES));
}

@end
