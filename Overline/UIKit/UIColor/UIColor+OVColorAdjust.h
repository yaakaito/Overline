//
//  UIColor+OVColorAdjust.h
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 23/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (OVColorAdjust)

/**
 Return a new UIColor with each parameter x mapped to f(x) = Kx + N.  Hue is wrapped, the others' clamped to 0..1.
 */
- (UIColor *)colorAugmentedByHueFactor:(CGFloat)hueK
                      saturationFactor:(CGFloat)satK
                      brightnessFactor:(CGFloat)brightK
                           alphaFactor:(CGFloat)alphaK
                              hueShift:(CGFloat)hueN
                       saturationShift:(CGFloat)satN
                       brightnessShift:(CGFloat)brightN
                            alphaShift:(CGFloat)alphaN;

//---------------------------------------------------------------------

/** Convenience method for doing just the brightness.  [0, 1) = dim, [1, inf) = brighten; */
- (UIColor *)colorWithBrightenessScaledBy:(CGFloat)factor;

/** Convenience method for doing just the saturation.  [0, 1) = desat, [1, inf) = saturate; */
- (UIColor *)colorWithSaturationScaledBy:(CGFloat)factor;

@end
