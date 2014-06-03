//
//  UIColor+OVColorAdjust.m
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 23/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import "UIColor+OVColorAdjust.h"

@implementation UIColor (OVColorAdjust)

- (UIColor *)colorAugmentedByHueFactor:(CGFloat)hueK saturationFactor:(CGFloat)satK brightnessFactor:(CGFloat)brightK alphaFactor:(CGFloat)alphaK hueShift:(CGFloat)hueN saturationShift:(CGFloat)satN brightnessShift:(CGFloat)brightN alphaShift:(CGFloat)alphaN
{
    CGFloat h, s, b, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    
    h = hueK * h + hueN;
    s = satK * s + satN;
    b = brightK * b + brightN;
    a = alphaK * a + alphaN;
    
    // wrap h, clamp the others
    if (h > 1) h = h - floorf(h);
    else if (h < 0) h += floorf(h);
    s = MAX(0.0, MIN(1.0, s));
    b = MAX(0.0, MIN(1.0, b));
    a = MAX(0.0, MIN(1.0, a));
    
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
}

//---------------------------------------------------------------------

- (UIColor *)colorWithBrightenessScaledBy:(CGFloat)factor
{
    return [self colorAugmentedByHueFactor:1 saturationFactor:1 brightnessFactor:factor alphaFactor:1 hueShift:0 saturationShift:0 brightnessShift:0 alphaShift:0];
}

//---------------------------------------------------------------------

- (UIColor *)colorWithSaturationScaledBy:(CGFloat)factor
{
    return [self colorAugmentedByHueFactor:1 saturationFactor:factor brightnessFactor:1 alphaFactor:1 hueShift:0 saturationShift:0 brightnessShift:0 alphaShift:0];
}



@end
