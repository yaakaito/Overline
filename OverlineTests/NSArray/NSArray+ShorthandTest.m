//
//  Overline - NSArray+ShorthandTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSArray+OVShorthand.h"

@interface NSArray_ShorthandTest : SenTestCase
{
    
}
@end

@implementation NSArray_ShorthandTest

- (void)testIsEmpty
{
    assertThatBool([(@[]) isEmpty], equalToBool(YES));
    assertThatBool([[NSArray array] isEmpty], equalToBool(YES));
    assertThatBool([(@[@1, @2]) isEmpty], equalToBool(NO));
}

@end
