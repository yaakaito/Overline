//
//  Overline - NSDictionary+SelectorTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "NSDictionary+Selector.h"

@interface NSDictionary_SelectorTest : SenTestCase
{
    NSDictionary *JSON;
}
@end

// {
//   "number" : 1,
//   "string" : "string",
//   "type" : 3,
//   "bool" : true,
//   "object" : {
//     "k" : "v"
//   },
//   "array" : [1,2,3],
//   "timestamp" : 1360000000,
//   "date8601" : "2013/01/01 12:24:36 +0900"
// }

static NSString *Dic_SelectorJSONString = @"{  \"number\" : 1,  \"string\" : \"string\",  \"type\" : 3,  \"bool\" : true,  \"object\" : {    \"k\" : \"v\"  },  \"array\" : [1,2,3],  \"timestamp\" : 1360000000,  \"date8601\" : \"2013/01/01 12:24:36 +0900\"}";

@implementation NSDictionary_SelectorTest


- (void)setUp {
    // Run before each test method
    JSON = [NSJSONSerialization JSONObjectWithData:[Dic_SelectorJSONString dataUsingEncoding:NSUTF8StringEncoding]
                                           options:NSJSONReadingAllowFragments
                                             error:nil];

}

- (void)tearDown {
    // Run after each test method
}

- (void)testObjectForKeyTransformBlock
{
    NSDate *date = [JSON objectForKey:@"date8601" transformBlock:^id(id obj) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss Z"];
        return [formatter dateFromString:obj];
    }];

    assertThatLongLong([date timeIntervalSince1970], equalToLongLong(1357010676));
}

@end
