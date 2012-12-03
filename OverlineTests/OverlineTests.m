//
//  OverlineTests.m
//  OverlineTests
//
//  Created by yaakaito on 12/12/01.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "OverlineTests.h"

@implementation OverlineTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSArray *array = @[@"a", @"b", @"c"];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);
        obj = @"ddd";
    }];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@", obj);
    }];
    
    STFail(@"hoge");
}

@end
