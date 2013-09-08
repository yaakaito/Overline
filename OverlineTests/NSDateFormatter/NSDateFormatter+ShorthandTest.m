//
//  Overline - NSDateFormatter+ShorthandTest.m
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//
//  Created by: yaakaito
//

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#import "NSDateFormatter+OVShorthand.h"

@interface NSDateFormatter_ShorthandTest : SenTestCase
{
    
}
@end

@implementation NSDateFormatter_ShorthandTest


- (void)setUp {
    // Run before each test method
}

- (void)tearDown {
    // Run after each test method
}

- (void)testFormatterWithCalendarLocaleTimezone
{
    NSDateFormatter *formatter = [NSDateFormatter dateFormatterWithCalendarIndentifiter:NSGregorianCalendar
                                                                      localeIdentifiter:@"ja_JP"
                                                                   timeZoneAbbreviation:@"JST"];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss Z"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1360000000];
    assertThat([formatter stringFromDate:date], equalTo(@"2013/02/05 02:46:40 +0900"));
}

- (void)testUserDefaultFormatter
{
    NSDateFormatter *formatter1 = [NSDateFormatter userDefaultFormatter];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"yyyy/MM/dd HH:mm:ss Z"];
    [formatter2 setDateFormat:@"yyyy/MM/dd HH:mm:ss Z"];

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1360000000];

    assertThat([formatter1 stringFromDate:date], equalTo([formatter2 stringFromDate:date]));
}

@end
