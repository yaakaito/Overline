#import <Foundation/Foundation.h>

@interface NSString (Debugging)

+ (NSString *)errorCodeStringFromOSStatus:(OSStatus)anOSStatus;

@end
