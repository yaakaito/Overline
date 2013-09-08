//
// Created by yaakaito on 2012/12/01.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "NSArray+OVSelector.h"

@implementation NSArray (OVSelector)

- (id)firstObject {
    if (self.count == 0) {
        return nil;
    }
    return [self objectAtIndex:0];
}
@end
