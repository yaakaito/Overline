//
// Created by yaakaito on 2013/01/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSData+OVBase64Encode.h"
#import "OVBase64Encode.h"

@implementation NSData (OVBase64Encode)

- (NSString *)base64Encode {
    return [self stringUsingEncodingBase64];
}

- (NSString *)stringUsingEncodingBase64 {
    const unsigned char * objRawData = [self bytes];
    char * objPointer;
    char * strResult;

    // Get the Raw Data length and ensure we actually have data
    int intLength = [self length];
    if (intLength == 0) return nil;

    // Setup the String-based Result placeholder and pointer within that placeholder
    strResult = (char *)calloc((((intLength + 2) / 3) * 4) + 1, sizeof(char));
    objPointer = strResult;

    // Iterate through everything
    while (intLength > 2) { // keep going until we have less than 24 bits
        *objPointer++ = _base64EncodingTable[objRawData[0] >> 2];
        *objPointer++ = _base64EncodingTable[((objRawData[0] & 0x03) << 4) + (objRawData[1] >> 4)];
        *objPointer++ = _base64EncodingTable[((objRawData[1] & 0x0f) << 2) + (objRawData[2] >> 6)];
        *objPointer++ = _base64EncodingTable[objRawData[2] & 0x3f];

        // we just handled 3 octets (24 bits) of data
        objRawData += 3;
        intLength -= 3;
    }

    // now deal with the tail end of things
    if (intLength != 0) {
        *objPointer++ = _base64EncodingTable[objRawData[0] >> 2];
        if (intLength > 1) {
            *objPointer++ = _base64EncodingTable[((objRawData[0] & 0x03) << 4) + (objRawData[1] >> 4)];
            *objPointer++ = _base64EncodingTable[(objRawData[1] & 0x0f) << 2];
            *objPointer++ = '=';
        } else {
            *objPointer++ = _base64EncodingTable[(objRawData[0] & 0x03) << 4];
            *objPointer++ = '=';
            *objPointer++ = '=';
        }
    }

    // Terminate the string-based result
    *objPointer = '\0';

    // Create result NSString object
    NSString *base64String = [NSString stringWithCString:strResult encoding:NSASCIIStringEncoding];

    // Free memory
    free(strResult);

    return base64String;
}
@end