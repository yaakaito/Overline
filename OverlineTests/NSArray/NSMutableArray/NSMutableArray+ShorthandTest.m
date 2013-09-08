//
//  Overline - NSMutableArray+ShorthandTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSMutableArray+OVShorthand.h"

@interface NSMutableArray_ShorthandTest : SenTestCase
{
    
}
@end

@implementation NSMutableArray_ShorthandTest

- (void)testInsertObjects {
    NSMutableArray *marray = [NSMutableArray arrayWithArray:@[@1,@2,@3]];
    [marray insertObjects:@[@4,@5,@6] atIndex:1];
    assertThat(marray, equalTo(@[@1,@4,@5,@6,@2,@3]));
}

@end
