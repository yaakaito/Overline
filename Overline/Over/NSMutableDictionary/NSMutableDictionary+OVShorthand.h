//
//  NSMutableDictionary+OVShorthand.h
//  Overline
//
//  Created by Hari Karam Singh on 03/06/2014.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (OVShorthand)

/** Returns a shallow immutable copy of the dict using `[NSDictionary dictionaryWithDictionary:]` */
- (NSDictionary *)immutableCopy;


@end
