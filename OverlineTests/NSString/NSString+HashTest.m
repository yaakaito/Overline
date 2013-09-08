//
//  Overline - NSString+HashTest.m
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSString+OVHash.h"

@interface NSString_HashTest : SenTestCase
{
    
}
@end

@implementation NSString_HashTest

- (void)testSha256 {
    assertThat([@"hoge" sha256], equalTo(@"ecb666d778725ec97307044d642bf4d160aabb76f56c0069c71ea25b1e926825"));
}

- (void)testStringByHashingSha256 {
    assertThat([@"hoge" stringByHashingSha256], equalTo(@"ecb666d778725ec97307044d642bf4d160aabb76f56c0069c71ea25b1e926825"));
}

- (void)testMD5 {
    assertThat([@"hoge" md5], equalTo(@"ea703e7aa1efda0064eaa507d9e8ab7e"));
}

- (void)testStringByHashingMD5 {
    assertThat([@"hoge" stringByHashingMD5], equalTo(@"ea703e7aa1efda0064eaa507d9e8ab7e"));
}

@end
