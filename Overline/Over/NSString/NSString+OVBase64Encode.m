//
// Created by yaakaito on 2013/01/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+OVBase64Encode.h"
#import "OVBase64Encode.h"
#import "NSData+OVBase64Encode.h"

@implementation NSString (OVBase64Encode)

- (NSString *)encodeBase64 {
    return [self stringByEncodingBase64];
}

- (NSString *)stringByEncodingBase64 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data stringUsingEncodingBase64];
}

- (NSString *)decodeBase64 {
    return [self stringByDecodingBase64];
}

- (NSString *)stringByDecodingBase64 {
    NSData *data = [self dataUsingDecodingBase64];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSData *)dataUsingDecodingBase64 {

    const char *objPointer = [self cStringUsingEncoding:NSASCIIStringEncoding];
    size_t intLength = strlen(objPointer);
    int intCurrent;
    int i = 0, j = 0, k;

    unsigned char *objResult = calloc(intLength, sizeof(unsigned char));

    // Run through the whole string, converting as we go
    while ( ((intCurrent = *objPointer++) != '\0') && (intLength-- > 0) ) {
        if (intCurrent == '=') {
            if (*objPointer != '=' && ((i % 4) == 1)) {// || (intLength > 0)) {
                // the padding character is invalid at this point -- so this entire string is invalid
                free(objResult);
                return nil;
            }
            continue;
        }

        intCurrent = _base64DecodingTable[intCurrent];
        if (intCurrent == -1) {
            // we're at a whitespace -- simply skip over
            continue;
        } else if (intCurrent == -2) {
            // we're at an invalid character
            free(objResult);
            return nil;
        }

        switch (i % 4) {
            case 0:
                objResult[j] = intCurrent << 2;
                break;

            case 1:
                objResult[j++] |= intCurrent >> 4;
                objResult[j] = (intCurrent & 0x0f) << 4;
                break;

            case 2:
                objResult[j++] |= intCurrent >>2;
                objResult[j] = (intCurrent & 0x03) << 6;
                break;

            case 3:
                objResult[j++] |= intCurrent;
                break;
        }
        i++;
    }

    // mop things up if we ended on a boundary
    k = j;
    if (intCurrent == '=') {
        switch (i % 4) {
            case 1:
                // Invalid state
                free(objResult);
                return nil;

            case 2:
                k++;
                // flow through
            case 3:
                objResult[k] = 0;
        }
    }

    // Cleanup and setup the return NSData
    NSData * objData = [[NSData alloc] initWithBytes:objResult length:j];
    free(objResult);
    return objData;
}
@end