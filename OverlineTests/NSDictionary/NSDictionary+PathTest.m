//
//  Overline - NSDictionary+PathTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSDictionary+OVPath.h"

@interface NSDictionary_PathTest : SenTestCase
{
    
}
@end

@implementation NSDictionary_PathTest

- (void)testObjectForPath
{
    NSString *result = [@{
        @"hoge" : @"fuga"
    } objectForPath:@"hoge"];
    assertThat(result, equalTo(@"fuga"));

    result = [@{
        @"p1" : @{
            @"p2" : @{
                @"p3" : @"value"
            }
        }
    } objectForPath:@"p1.p2.p3"];
    assertThat(result, equalTo(@"value"));

    result = [@{
            @"p1" : @{
                    @"p2" : @{
                            @"p3" : @"value"
                    }
            }
    } objectForPath:@"p1.p2.p4"];
    assertThat(result, equalTo(nil));

    result = [@{
            @"p1" : @{
                    @"p2" : @{
                            @"p3" : @"value"
                    }
            }
    } objectForPath:@"p1.p5.p4"];
    assertThat(result, equalTo(nil));
}

@end
