//
// Created by kazuma.ukyo on 12/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSNull+Natural.h"

@implementation NSNull (Natural)
- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self respondsToSelector:[invocation selector]]) {
        [invocation invokeWithTarget:self];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *sig=[[NSNull class] instanceMethodSignatureForSelector:selector];
    if(sig==nil) {
        sig=[NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    }
    return sig;
}

@end
