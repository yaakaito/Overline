//
//  Overline - NSObject+EqualsTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSNull+Natural.h"
#import "NSObject+Equals.h"

@interface NSObject_EqualsTest : SenTestCase
{
    
}
@end

@implementation NSObject_EqualsTest

- (void)testIsNullObject
{
    assertThatBool([[NSArray array] isNullObject], equalToBool(NO));
    assertThatBool([@1 isNullObject], equalToBool(NO));
    assertThatBool([@"string" isNullObject], equalToBool(NO));
    assertThatBool([[NSNull null] isNullObject], equalToBool(YES));
}

@end
