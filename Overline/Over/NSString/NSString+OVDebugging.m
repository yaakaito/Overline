#import "NSString+OVDebugging.h"

@implementation NSString (OVDebugging)

+ (NSString *)errorCodeStringFromOSStatus:(OSStatus)anOSStatus
{
    char str[10]="";
    OSStatus error = anOSStatus;
    
    // see if it appears to be a 4-char-code
    *(UInt32 *)(str + 1) = CFSwapInt32HostToBig(error);
    if (isprint(str[1]) && isprint(str[2]) && isprint(str[3]) && isprint(str[4])) {
        str[0] = str[5] = '\'';
        str[6] = '\0';
    } else {
        // no, format it as an integer
        sprintf(str, "%d", (int)error);
    }
    
    return [NSString stringWithUTF8String:str];
}

@end
