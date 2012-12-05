//
//  Overline - NSArray+Enumeration.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define OV_SHORTHAND
#import "NSArray+Enumeration.h"

@interface NSArray_Enumeration : SenTestCase
{
    
}
@end

@implementation NSArray_Enumeration

- (void)testEach
{
    __block NSUInteger lastIdx;
    [@[@1, @2, @3] each:^(id obj, NSUInteger idx) {
        assertThat(obj, equalTo([@[@1, @2, @3] objectAtIndex:idx]));
        lastIdx = idx;
    }];
    assertThat(@(lastIdx), equalTo(@2));
}

- (void)testMap
{
    NSArray *mapped = [@[@1,@2,@3,@4,@5,@6] map:^id(id obj, NSUInteger idx) {
        if ([obj integerValue] % 2 == 0) {
            return obj;
        }
        return nil;
    }];
    assertThat(mapped, equalTo(@[@2,@4,@6]));
}

- (void)testMappedArrayUsingBlock
{
    NSArray *mapped = [@[@1,@2,@3,@4,@5,@6] mappedArrayUsingBlock:^id(id obj, NSUInteger idx) {
        if ([obj integerValue] % 2 == 0) {
            return obj;
        }
        return nil;
    }];
    assertThat(mapped, equalTo(@[@2,@4,@6]));
}

- (void)testReduce
{
    id obj = [@[@1,@2,@3] reduce:^id(id memo, id obj) {
        return @([memo integerValue] + [obj integerValue]);
    } memo:@0];
    assertThat(obj, equalTo(@6));
}

- (void)reducedObjectByBlock
{
    id obj = [@[@1,@2,@3] reducedObjectByBlock:^id(id memo, id obj) {
        return @([memo integerValue] + [obj integerValue]);
    } memo:@0];
    assertThat(obj, equalTo(@6));}
@end
