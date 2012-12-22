//
// Created by yaakaito on 2012/12/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSString (RegularExpression)

- (NSRange)rangeOfFirstMatchInString:(NSString *)string;
- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (NSArray *)matchesInString:(NSString *)string;
- (NSArray *)matchesInString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (BOOL)testInString:(NSString *)string;
- (BOOL)testInString:(NSString *)string options:(NSRegularExpressionOptions)options;
@end