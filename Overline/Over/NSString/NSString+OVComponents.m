//
// Created by yaakaito on 2012/12/16.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+OVComponents.h"


@implementation NSString (OVComponents)
- (NSDictionary *)componentsSeparatedByInnerString:(NSString *)inner andOuterString:(NSString *)outer {
    NSArray *first = [self componentsSeparatedByString:outer];

    NSInteger count = [first count];
    NSMutableDictionary *returnDictionary = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        NSArray *second = [(NSString *)[first objectAtIndex:i] componentsSeparatedByString:inner];
        if ([second count] == 2) {
            [returnDictionary setObject:[second objectAtIndex:1] forKey:[second objectAtIndex:0]];
        }
    }

    return returnDictionary;
}
@end