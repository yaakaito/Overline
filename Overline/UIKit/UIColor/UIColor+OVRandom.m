//
//  UIColor+OVRandom.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 04/06/2014.
//
//

#import "UIColor+OVRandom.h"

@implementation UIColor (OVRandom)

+ (UIColor *)randomColor
{
    return [self randomColorWithAlpha:1.0];
}

//---------------------------------------------------------------------

+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha
{
    CGFloat h = arc4random_uniform(INT32_MAX) / (CGFloat)INT32_MAX;
    CGFloat s = arc4random_uniform(INT32_MAX) / (CGFloat)INT32_MAX;
    CGFloat b = arc4random_uniform(INT32_MAX) / (CGFloat)INT32_MAX;
    
    // I believe HSB gives more variety where rgb is skewed towards muted tones
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:alpha];
}

//---------------------------------------------------------------------

+ (UIColor *)randomHue
{
    return [self randomHueWithSaturation:1 brightness:1 alpha:1];
}

//---------------------------------------------------------------------

+ (UIColor *)randomHueWithAlpha:(CGFloat)alpha
{
    return [self randomHueWithSaturation:1 brightness:1 alpha:alpha];
}

//---------------------------------------------------------------------

+ (UIColor *)randomHueWithSaturation:(CGFloat)s brightness:(CGFloat)b alpha:(CGFloat)a
{
    CGFloat h = arc4random_uniform(INT32_MAX) / (CGFloat)INT32_MAX;
    
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
}


@end
