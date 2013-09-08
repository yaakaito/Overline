//
// Created by yaakaito on 2012/12/30.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+OVURLEncode.h"


@implementation NSString (OVURLEncode)

- (NSString *)URLEncode {
    return [self stringByEncodingURL];
}

- (NSString *)stringByEncodingURL {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)@"!*'();:@&=+$.,/?%#[]", kCFStringEncodingUTF8);
}

- (NSString *)URLDecode {
    return [self stringByDecodingURL];
}

- (NSString *)stringByDecodingURL {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8);
}
@end