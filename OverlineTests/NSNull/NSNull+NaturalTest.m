//
//  Overline - NSNull+NaturalTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: kazuma.ukyo
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSNull+OVNatural.h"

@interface NSNull_NaturalTest : SenTestCase
{
    
}
@end

@implementation NSNull_NaturalTest

- (void)testNatural
{
    NSDictionary *dic = @{
            @"null-key" : [NSNull null]
    };
    assertThat([[dic objectForKey:@"null-key"] objectForKey:@"fail"], equalTo(nil));
}
@end
