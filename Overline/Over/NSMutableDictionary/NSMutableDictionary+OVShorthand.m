//
//  NSMutableDictionary+OVShorthand.m
//  Overline
//
//  Created by Hari Karam Singh on 03/06/2014.
//
//

#import "NSMutableDictionary+OVShorthand.h"

@implementation NSMutableDictionary (OVShorthand)

- (NSDictionary *)immutableCopy
{
    return [NSDictionary dictionaryWithDictionary:self];
}

@end
