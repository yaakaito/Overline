//
// Created by yaakaito on 2012/12/30.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface NSString (OVURLEncode)
- (NSString *)URLEncode;
- (NSString *)stringByEncodingURL;
- (NSString *)URLDecode;
- (NSString *)stringByDecodingURL;
@end