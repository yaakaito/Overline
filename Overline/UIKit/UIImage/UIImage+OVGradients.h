//
//  UIImage+OVGradients.h
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 23/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OVGradients)

+ (UIImage *)gradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
+ (UIImage *)horizontalGradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict;
+ (UIImage *)verticalGradientImageWithSize:(CGSize)size colors:(NSDictionary *)locationsColorsDict;


@end
