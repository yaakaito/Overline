//
// Created by yaakaito on 2013/03/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSDateFormatter (Shorthand)
+ (instancetype)dateFormatterWithCalendarIndetifiter:(NSString *)calendar
                                   LocaleIdentifiter:(NSString *)locale
                                timeZoneAbbreviation:(NSString *)timeZone;
+ (instancetype)userDefaultFormatter;
@end