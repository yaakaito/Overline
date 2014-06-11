//
//  UIColor+OVRandom.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 04/06/2014.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (OVRandom)

/** Returns a random solid (alpha=1) color */
+ (UIColor *)randomColor;

/** Returns a random color with te specified alpha */
+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha;

/** Max saturation, brightness & alpha */
+ (UIColor *)randomHue;

/** Random color with specified alpha but with max saturation and brightness. The most useful verison for debugging imo.  */
+ (UIColor *)randomHueWithAlpha:(CGFloat)alpha;

/** Randomises just the hue */
+ (UIColor *)randomHueWithSaturation:(CGFloat)s brightness:(CGFloat)b alpha:(CGFloat)a;



@end
