//
//  Overline - NSArray+RandomTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSArray+Random.h"

@interface NSArray_RandomTest : SenTestCase
{
    
}
@end

@implementation NSArray_RandomTest


- (void)testShuffle {
    NSArray *shuffled = [@[@1,@2,@3,@4,@5,@6] shuffle];
    assertThat(@([shuffled count]), equalTo(@6));
    [SenTestLog testLogWithFormat:[NSString stringWithFormat:@"%@", shuffled]];
}

- (void)testShuffledArray {
    NSArray *shuffled = [@[@1,@2,@3,@4,@5,@6] shuffledArray];
    assertThat(@([shuffled count]), equalTo(@6));
    [SenTestLog testLogWithFormat:[NSString stringWithFormat:@"%@", shuffled]];
}

- (void)testAnyObject {
    NSArray *array = @[@1, @2, @3];

    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
    assertThatBool([array indexOfObject:[array anyObject]] != NSNotFound, equalToBool(YES));
}
@end
