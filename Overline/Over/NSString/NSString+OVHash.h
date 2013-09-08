//
// Created by yaakaito on 2012/12/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSString (OVHash)
- (NSString *)sha256;
- (NSString *)stringByHashingSha256;
- (NSString *)md5;
- (NSString *)stringByHashingMD5;
@end