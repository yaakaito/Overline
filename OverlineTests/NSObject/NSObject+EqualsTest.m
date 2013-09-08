//
//  Overline - NSObject+EqualsTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSNull+OVNatural.h"
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

- (void)testIsArray {
    assertThatBool([[NSArray array] isArray], equalToBool(YES));
    assertThatBool([[NSDictionary dictionary] isArray], equalToBool(NO));
    assertThatBool([[NSSet set] isArray], equalToBool(NO));
    assertThatBool([[NSString string] isArray], equalToBool(NO));
    assertThatBool([[NSNumber numberWithBool:YES] isArray], equalToBool(NO));
    assertThatBool([[[NSObject alloc] init] isArray], equalToBool(NO));
}

- (void)testIsDictionary {
    assertThatBool([[NSDictionary dictionary] isDictionary], equalToBool(YES));
    assertThatBool([[NSArray array] isDictionary], equalToBool(NO));
    assertThatBool([[NSSet set] isDictionary], equalToBool(NO));
    assertThatBool([[NSString string] isDictionary], equalToBool(NO));
    assertThatBool([[NSNumber numberWithBool:YES] isDictionary], equalToBool(NO));
    assertThatBool([[[NSObject alloc] init] isDictionary], equalToBool(NO));
}

- (void)testIsSet {
    assertThatBool([[NSSet set] isSet], equalToBool(YES));
    assertThatBool([[NSDictionary dictionary] isSet], equalToBool(NO));
    assertThatBool([[NSArray array] isSet], equalToBool(NO));
    assertThatBool([[NSString string] isSet], equalToBool(NO));
    assertThatBool([[NSNumber numberWithBool:YES] isSet], equalToBool(NO));
    assertThatBool([[[NSObject alloc] init] isSet], equalToBool(NO));     
}

- (void)testIsString {
    assertThatBool([[NSString string] isString], equalToBool(YES));
    assertThatBool([[NSDictionary dictionary] isString], equalToBool(NO));
    assertThatBool([[NSArray array] isString], equalToBool(NO));
    assertThatBool([[NSSet set] isString], equalToBool(NO));
    assertThatBool([[NSNumber numberWithBool:YES] isString], equalToBool(NO));
    assertThatBool([[[NSObject alloc] init] isString], equalToBool(NO));     
}

- (void)testIsNumber {
    assertThatBool([[NSNumber numberWithBool:YES] isNumber], equalToBool(YES));
    assertThatBool([[NSDictionary dictionary] isNumber], equalToBool(NO));
    assertThatBool([[NSArray array] isNumber], equalToBool(NO));
    assertThatBool([[NSSet set] isNumber], equalToBool(NO));
    assertThatBool([[NSString string] isNumber], equalToBool(NO));
    assertThatBool([[[NSObject alloc] init] isNumber], equalToBool(NO));     
}
@end
