//
// Created by yaakaito on 2012/12/.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>

@interface NSArray (OVSelector)

/** Returns first object in array or nil if none (unlike -objectAtIndex:0 which throws NSRangeException) */
- (id)firstObject;
@end
