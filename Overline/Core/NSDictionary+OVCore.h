//
// Created by kazuma.ukyo on 3/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (OVCore)
- (void)each:(void (^)(id obj, NSString *key))block;
- (NSDictionary *)map:(id (^)(id obj, NSString *key))block;
- (id)reduce:(id (^)(id memo, id obj, NSString *key))block memo:(id)memo;
@end