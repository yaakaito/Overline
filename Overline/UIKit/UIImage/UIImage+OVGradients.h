//
//  UIImage+OVGradients.h
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 23/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OVGradients)


/** 
 Draws a gradient in the rectangle defined by `size` along the line defined by startPoint/endPoint.
 
 @param locationsColorsDict     Dict whose keys are NSNumbers with color position (0, 1 represent the start, end point colours but you arent limited to these) and whose values are the UIColors themselves.
 */
+ (UIImage *)gradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/** Convenience method for a gradient along the horizontal axis with locations 0,1 pinned to the left/right edges */
+ (UIImage *)horizontalGradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict;

/** Convenience method for a gradient along the horizontal axis with locations 0,1 pinned to the top/bottom edges */
+ (UIImage *)verticalGradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict;


@end
