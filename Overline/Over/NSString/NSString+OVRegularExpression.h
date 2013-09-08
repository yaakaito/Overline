//
// Created by yaakaito on 2012/12/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSString (OVRegularExpression)

- (NSRange)rangeOfFirstMatchInString:(NSString *)string;
- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (NSArray *)matchesInString:(NSString *)string;
- (NSArray *)matchesInString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (BOOL)testInString:(NSString *)string;
- (BOOL)testInString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (NSString *)replace:(NSString *)regexpPattern newString:(NSString *)string;
- (NSString *)replace:(NSString *)regexpPattern newString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withString:(NSString *)string;
- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withString:(NSString *)string options:(NSRegularExpressionOptions)options;
- (NSString *)replace:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate;
- (NSString *)replace:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate options:(NSRegularExpressionOptions)options;
- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate;
- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate options:(NSRegularExpressionOptions)options;

@end