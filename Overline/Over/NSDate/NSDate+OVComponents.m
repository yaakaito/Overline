//
//  NSDate+Components.m
//  Overline
//
//  Created by Hari Karam Singh on 16/08/2013.
//  Copyright (c) 2013 yaakaito. All rights reserved.
//

#import "NSDate+OVComponents.h"

@implementation NSDate (OVComponents)


/////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods
/////////////////////////////////////////////////////////////////////////

+ (NSInteger)currentWeekday
{
    return [NSDate.date weekday];
}

//---------------------------------------------------------------------

+ (NSInteger)currentHour
{
    return [NSDate.date hour];
}

//---------------------------------------------------------------------

+ (NSInteger)currentMinute
{
    return [NSDate.date minute];
}

//---------------------------------------------------------------------

+ (NSInteger)currentSecond
{
    return [NSDate.date second];
}

//---------------------------------------------------------------------

+ (NSInteger)currentYear
{
    return [NSDate.date year];
}

//---------------------------------------------------------------------

+ (NSInteger)currentMonth
{
    return [NSDate.date month];
}

//---------------------------------------------------------------------

+ (NSInteger)currentDay
{
    return [NSDate.date day];
}

//---------------------------------------------------------------------

+ (NSDateComponents *)commonDateComponentsForNow
{
    return [NSDate.date commonDateComponents];
}

//---------------------------------------------------------------------

+ (NSDateComponents *)timeComponentsForNow
{
    return [NSDate.date timeComponents];
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
/////////////////////////////////////////////////////////////////////////



- (NSInteger)weekday
{
    return [[NSCalendar currentCalendar] components:NSWeekCalendarUnit fromDate:self].weekday;
}

//---------------------------------------------------------------------

- (NSInteger)hour
{
    return [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:self].hour;
}

//---------------------------------------------------------------------

- (NSInteger)minute
{
    return [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:self].minute;
}

//---------------------------------------------------------------------

- (NSInteger)second
{
    return [[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:self].second;
}

//---------------------------------------------------------------------

- (NSInteger)day
{
    return [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:self].day;
}

//---------------------------------------------------------------------

- (NSInteger)month
{
    return [[NSCalendar currentCalendar] components:NSMonthCalendarUnit fromDate:self].month;
}

//---------------------------------------------------------------------

- (NSInteger)year
{
    return [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self].year;
}

//---------------------------------------------------------------------

- (NSDateComponents *)commonDateComponents
{
    return [[NSCalendar currentCalendar] components:NSYearCalendarUnit |
                                                   NSMonthCalendarUnit |
                                                   NSDayCalendarUnit |
                                                   NSWeekdayCalendarUnit |
                                                   NSHourCalendarUnit |
                                                   NSMinuteCalendarUnit |
                                                   NSSecondCalendarUnit
                                           fromDate:self];
}

//---------------------------------------------------------------------

- (NSDateComponents *)timeComponents
{
    return [[NSCalendar currentCalendar] components:NSHourCalendarUnit |
                                                    NSMinuteCalendarUnit |
                                                    NSSecondCalendarUnit
                                           fromDate:self];
}




@end
