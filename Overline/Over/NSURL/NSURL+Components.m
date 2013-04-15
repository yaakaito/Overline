//
// Created by yaakaito on 2012/12/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSURL+Components.h"
#import "NSString+Components.h"


@implementation NSURL (Components)
- (NSDictionary *)queryComponents {
    return [[self query] componentsSeparatedByInnerString:@"=" andOuterString:@"&"];
}
@end