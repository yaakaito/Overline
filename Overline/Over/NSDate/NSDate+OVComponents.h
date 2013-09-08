//
//  NSDate+Components.h
//  Overline
//
//  Created by Hari Karam Singh on 16/08/2013.
//  Copyright (c) 2013 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (OVComponents)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Class Methods
/////////////////////////////////////////////////////////////////////////

/** Weekday integer fur current day of the week.  See -weekday */
+ (NSInteger)currentWeekday;

/** Current hour based on the current calendar */
+ (NSInteger)currentHour;

/** Current minute based on the current calendar */
+ (NSInteger)currentMinute;

/** Current minute based on the current calendar */
+ (NSInteger)currentSecond;

+ (NSInteger)currentDay;

+ (NSInteger)currentMonth;

+ (NSInteger)currentYear;

+ (NSDateComponents *)commonDateComponentsForNow;

+ (NSDateComponents *)timeComponentsForNow;

/////////////////////////////////////////////////////////////////////////
#pragma mark - Instance Methods
/////////////////////////////////////////////////////////////////////////

/** Weekday integer 0-6 for M-S (for Gregorian, See NSDateComponents for more details) */
- (NSInteger)weekday;

/** Shortcut to get the date's hour in the current calendar */
- (NSInteger)hour;

/** Shortcut to get the date's minute in the current calendar */
- (NSInteger)minute;

/** Shortcut to get the date's second in the current calendar */
- (NSInteger)second;

/** Shortcut to get the date's day of the month in the current calendar */
- (NSInteger)day;

/** Shortcut to get the date's month in the current calendar */
- (NSInteger)month;

/** Shortcut to get the date's year in the current calendar */
- (NSInteger)year;

/** Returns date components for the calendar style date and time: year, month, day, hour, minute, second, weekday */
- (NSDateComponents *)commonDateComponents;

/** Returns an NSDateComponents with hour, minute, seconds */
- (NSDateComponents *)timeComponents;



@end
