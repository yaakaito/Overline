//
// Created by yaakaito on 2012/12/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSBundle+OVShorthand.h"

@implementation NSBundle (OVShorthand)
- (id)JSONForResourceName:(NSString *)resourceName {
    NSData *jsonData = [NSData dataWithContentsOfFile:[self pathForResource:resourceName ofType:@"json"]];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:NULL];
}
@end