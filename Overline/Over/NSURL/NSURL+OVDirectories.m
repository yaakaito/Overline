
#import "NSURL+OVDirectories.h"

@implementation NSURL (OVDirectories)

+ (NSURL *)URLForDirectory:(NSSearchPathDirectory)directoryConstant domainMask:(NSSearchPathDomainMask)domainMask
{
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:directoryConstant
                                             inDomains:domainMask];
    NSURL* url = nil;
    
    if ([possibleURLs count] >= 1) {
        // Use the first directory (if multiple are returned)
        url = [possibleURLs objectAtIndex:0];
    }

    return url;
}

//---------------------------------------------------------------------

+ (NSURL *)URLForApplicationSupportDataDirectory
{
    NSURL *appSupportDir = [self URLForDirectory:NSApplicationSupportDirectory domainMask:NSUserDomainMask];
    
    // If a valid app support directory exists, add the
    // app's bundle ID to it to specify the final directory.
    if (appSupportDir) {
        NSString* appBundleID = [[NSBundle mainBundle] bundleIdentifier];
        return [appSupportDir URLByAppendingPathComponent:appBundleID];
    } else
        return nil;
}

//---------------------------------------------------------------------

+ (NSURL *)URLForApplicationSupportWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForApplicationSupportDataDirectory] URLByAppendingPathComponent:pathToAppend];
}

//---------------------------------------------------------------------

+ (NSURL *)URLForUserDirectory
{
    return [self URLForDirectory:NSUserDirectory domainMask:NSUserDomainMask];
}

//---------------------------------------------------------------------

+ (NSURL *)URLForUserDirectoryWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForUserDirectory] URLByAppendingPathComponent:pathToAppend];
    
}

//---------------------------------------------------------------------

+ (NSURL *)URLForDocumentDirectory
{
    return [self URLForDirectory:NSDocumentDirectory domainMask:NSUserDomainMask];
}

//---------------------------------------------------------------------

+ (NSURL *)URLForDocumentDirectoryWithAppendedPath:(NSString *)pathToAppend
{
    return [[self URLForDocumentDirectory] URLByAppendingPathComponent:pathToAppend];
}

@end


