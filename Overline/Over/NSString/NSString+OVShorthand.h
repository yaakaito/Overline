//
// Created by yaakaito on 2012/12/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSString (OVShorthand)

/** Trims whitespace and newlines from the ends of the string */
- (NSString *)trim;

/** Trim the ends of the string with the characters in the provided string */
- (NSString *)trim:(NSString *)characters;
@end