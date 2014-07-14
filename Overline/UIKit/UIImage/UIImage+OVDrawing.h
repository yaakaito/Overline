//
//  UIImage+OVDrawing.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 05/06/2014.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (OVDrawing)

/** Create an image from the bezierpath and the given colors.  Pass nil for a color to have it not draw that portion */
+ (UIImage *)imageFromBezierPath:(UIBezierPath *)path withFillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor;

@end
