//
//  NSDate+Components.m
//  Overline
//
//  Created by Hari Karam Singh on 16/08/2013.
//  Copyright (c) 2013 yaakaito. All rights reserved.
//

#import "NSDate+Components.h"

@implementation NSDate (Components)


/////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods
/////////////////////////////////////////////////////////////////////////

+ (NSInteger)currentWeekday
{
    return NSDate.date.weekday;
}

//---------------------------------------------------------------------

+ (NSInteger)currentHour
{
    return NSDate.date.hour;
}

//---------------------------------------------------------------------

+ (NSInteger)currentMinute
{
    return NSDate.date.minute;
}

//---------------------------------------------------------------------

+ (NSInteger)currentSecond
{
    return NSDate.date.second;
}

//---------------------------------------------------------------------

+ (NSInteger)currentYear
{
    return NSDate.date.year;
}

//---------------------------------------------------------------------

+ (NSInteger)currentMonth
{
    return NSDate.date.month;
}

//---------------------------------------------------------------------

+ (NSInteger)currentDay
{
    return NSDate.date.day;
}

//---------------------------------------------------------------------

+ (NSDateComponents *)commonDateComponentsForNow
{
    return  NSDate.date.commonDateComponents;
}

//---------------------------------------------------------------------

+ (NSDateComponents *)timeComponentsForNow
{
    return  NSDate.date.timeComponents;
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
/////////////////////////////////////////////////////////////////////////



- (NSInteger)weekday
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self].weekday;
}

//---------------------------------------------------------------------

- (NSInteger)hour
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self].hour;
}

//---------------------------------------------------------------------

- (NSInteger)minute
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self].minute;
}

//---------------------------------------------------------------------

- (NSInteger)second
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self].second;
}

//---------------------------------------------------------------------

- (NSInteger)day
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self].day;
}

//---------------------------------------------------------------------

- (NSInteger)month
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self].month;
}

//---------------------------------------------------------------------

- (NSInteger)year
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self].year;
}

//---------------------------------------------------------------------

- (NSDateComponents *)commonDateComponents
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear |
                                                   NSCalendarUnitMonth |
                                                   NSCalendarUnitDay |
                                                   NSCalendarUnitWeekday |
                                                   NSCalendarUnitHour |
                                                   NSCalendarUnitMinute |
                                                   NSCalendarUnitSecond
                                           fromDate:self];
}

//---------------------------------------------------------------------

- (NSDateComponents *)timeComponents
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitHour |
                                                    NSCalendarUnitMinute |
                                                    NSCalendarUnitSecond
                                           fromDate:self];
}




@end
