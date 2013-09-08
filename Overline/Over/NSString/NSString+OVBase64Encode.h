//
// Created by yaakaito on 2013/01/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSString (OVBase64Encode)
- (NSString *)encodeBase64;
- (NSString *)stringByEncodingBase64;
- (NSString *)decodeBase64;
- (NSString *)stringByDecodingBase64;
- (NSData *)dataUsingDecodingBase64;
@end