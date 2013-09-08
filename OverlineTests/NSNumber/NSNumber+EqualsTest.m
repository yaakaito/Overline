//
//  Overline - NSNumber+EqualsTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSNumber+OVEquals.h"

@interface NSNumber_EqualsTest : SenTestCase
{
    
}
@end

@implementation NSNumber_EqualsTest

- (void)testIsEqualToInt {
    assertThatBool([@2 isEqualToInt:2], equalToBool(YES));
    assertThatBool([@1 isEqualToInt:0], equalToBool(NO));
}

- (void)testIsEqualToInteger {
    assertThatBool([@2147483647 isEqualToInteger:(NSInteger)2147483647], equalToBool(YES));
    assertThatBool([@1 isEqualToInteger:0], equalToBool(NO));
}

- (void)testIsEqualToUnsignedInt {
    assertThatBool([@2 isEqualToUnsignedInt:2], equalToBool(YES));
    assertThatBool([@1 isEqualToUnsignedInt:0], equalToBool(NO));
}

- (void)testIsEqualToUnsignedInteger {
    assertThatBool([@4294967295 isEqualToUnsignedInteger:(NSUInteger)4294967295], equalToBool(YES));
    assertThatBool([@1 isEqualToUnsignedInteger:0], equalToBool(NO));
}

- (void)testIsEqualToLong {
    assertThatBool([@2147483647 isEqualToLong:(long)2147483647], equalToBool(YES));
    assertThatBool([@1 isEqualToLong:0], equalToBool(NO));
}

- (void)testIsEqualToLongLong {
    assertThatBool([@9223372036854775807 isEqualToLongLong:(long long)9223372036854775807], equalToBool(YES));
    assertThatBool([@1 isEqualToLongLong:0], equalToBool(NO));
}

- (void)testIsEqualToUnsignedLong {
    assertThatBool([@4294967295 isEqualToUnsignedLong:(unsigned long)4294967295], equalToBool(YES));
    assertThatBool([@1 isEqualToUnsignedLong:0], equalToBool(NO));
}

- (void)testIsEqualToUnsignedLongLong {
    assertThatBool([@18446744073709551615 isEqualToUnsignedLongLong:(unsigned long long)18446744073709551615], equalToBool(YES));
    assertThatBool([@1 isEqualToUnsignedLongLong:0], equalToBool(NO));
}

- (void)testIsEqualToDouble {
    assertThatBool([@0.5 isEqualToDouble:0.5], equalToBool(YES));
    assertThatBool([@0.1 isEqualToDouble:0], equalToBool(NO));
}

- (void)testIsEqualToFloat {
    assertThatBool([@0.5 isEqualToFloat:0.5], equalToBool(YES));
    assertThatBool([@0.1 isEqualToFloat:0], equalToBool(NO));
}


@end
