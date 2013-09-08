//
// Created by yaakaito on 2012/12/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSURL+OVComponents.h"
#import "NSString+OVComponents.h"


@implementation NSURL (OVComponents)
- (NSDictionary *)queryComponents {
    return [[self query] componentsSeparatedByInnerString:@"=" andOuterString:@"&"];
}
@end