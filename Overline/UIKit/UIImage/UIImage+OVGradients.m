//
//  UIImage+OVGradients.m
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 23/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import "UIImage+OVGradients.h"

@implementation UIImage (OVGradients)

+ (UIImage *)gradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    UIImage *resultImg;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // Convert dict to C arrays
        NSUInteger count = locationsColorsDict.count;
        CGFloat *locations = malloc(count * sizeof(CGFloat));
        CGFloat *components = malloc(count * sizeof(CGFloat) * 4);   // assumes RGBA color space
        NSArray *locsArr = locationsColorsDict.allKeys;
        for (int i=0; i<count; i++) {
            CGFloat l = [locsArr[i] floatValue];    // cover 64bit 32 will round
            locations[i] = l;
            CGFloat r, g, b, a;
            UIColor *color = locationsColorsDict[locsArr[i]];
            [color getRed:&r green:&g blue:&b alpha:&a];
            components[4*i+0] = r;
            components[4*i+1] = g;
            components[4*i+2] = b;
            components[4*i+3] = a;
        }
        
        CGGradientRef grad =
        CGGradientCreateWithColorComponents(CGBitmapContextGetColorSpace(ctx),
                                            components,
                                            locations,
                                            count);
        
        CGContextDrawLinearGradient(ctx, grad, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation |kCGGradientDrawsAfterEndLocation);
        CGGradientRelease(grad);
        free(components);
        free(locations);
        
        resultImg = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return resultImg;
}

+ (UIImage *)horizontalGradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict
{
    return [self gradientImageWithSize:size colors:locationsColorsDict startPoint:CGPointMake(0, 0) endPoint:CGPointMake(size.width, 0)];
}

+ (UIImage *)verticalGradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict
{
    return [self gradientImageWithSize:size colors:locationsColorsDict startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, size.height)];
}

@end
