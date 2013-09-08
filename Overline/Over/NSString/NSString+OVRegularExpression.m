//
// Created by yaakaito on 2012/12/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+OVRegularExpression.h"
#import "NSArray+OVEnumeration.h"

@implementation NSString (OVRegularExpression)
- (NSRange)rangeOfFirstMatchInString:(NSString *)string {
    return [self rangeOfFirstMatchInString:string options:NSRegularExpressionSearch];
}

- (NSRange)rangeOfFirstMatchInString:(NSString *)string options:(NSRegularExpressionOptions)options {
    return [string rangeOfString:self options:options];
}

- (NSArray *)matchesInString:(NSString *)string {
    return [self matchesInString:string options:NSRegularExpressionSearch];
}

- (NSArray *)matchesInString:(NSString *)string options:(NSRegularExpressionOptions)options {
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self
                                                                           options:options
                                                                             error:&error];
    NSArray *maches = [regex matchesInString:string
                                     options:0 range:NSMakeRange(0, [string length])];

    return [maches mappedArrayUsingBlock:^id(id obj, NSUInteger idx) {
        NSTextCheckingResult *res = obj;
        return [string substringWithRange:[res range]];
    }];
}

- (BOOL)testInString:(NSString *)string {
    return [self testInString:string options:NSRegularExpressionSearch];
}

- (BOOL)testInString:(NSString *)string options:(NSRegularExpressionOptions)options {
    return [self rangeOfFirstMatchInString:string options:options].location != NSNotFound;
}

- (NSString *)replace:(NSString *)regexpPattern newString:(NSString *)string {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withString:string];
}

- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withString:(NSString *)string {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withString:string options:NSRegularExpressionSearch];
}

- (NSString *)replace:(NSString *)regexpPattern newString:(NSString *)string options:(NSRegularExpressionOptions)options {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withString:string options:options];
}

- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withString:(NSString *)string options:(NSRegularExpressionOptions)options {
    NSError *error = nil;
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:regexpPattern
                                                                            options:options
                                                                              error:&error];
    NSString *replaced = [regexp stringByReplacingMatchesInString:self
                                                          options:NSMatchingReportProgress
                                                            range:NSMakeRange(0, self.length)
                                                     withTemplate:string];
    return replaced;
}

- (NSString *)replace:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withTemplate:aTemplate];
}

- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withTemplate:aTemplate options:NSRegularExpressionSearch];
}

- (NSString *)replace:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate options:(NSRegularExpressionOptions)options {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withTemplate:aTemplate options:options];
}

- (NSString *)stringByReplacingOccurrencesOfRegExpPattern:(NSString *)regexpPattern withTemplate:(NSString *)aTemplate options:(NSRegularExpressionOptions)options {
    return [self stringByReplacingOccurrencesOfRegExpPattern:regexpPattern withString:aTemplate options:options];
}
@end