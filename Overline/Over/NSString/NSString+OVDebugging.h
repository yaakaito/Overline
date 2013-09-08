#import <Foundation/Foundation.h>

@interface NSString (OVDebugging)

+ (NSString *)errorCodeStringFromOSStatus:(OSStatus)anOSStatus;

@end
