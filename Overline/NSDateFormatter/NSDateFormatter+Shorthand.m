//
// Created by yaakaito on 2013/03/28.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDateFormatter+Shorthand.h"


@implementation NSDateFormatter (Shorthand)
+ (instancetype)dateFormatterWithCalendarIndetifiter:(NSString *)calendar
                                   LocaleIdentifiter:(NSString *)locale
                                timeZoneAbbreviation:(NSString *)timeZone {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:calendar];
    formatter.locale   = [[NSLocale alloc] initWithLocaleIdentifier:locale];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:timeZone];
    return formatter;
}
@end