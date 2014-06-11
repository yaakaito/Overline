//
//  UIImage+OVDrawing.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 05/06/2014.
//
//

#import "UIImage+OVDrawing.h"

@implementation UIImage (OVDrawing)

+ (UIImage *)imageFromBezierPath:(UIBezierPath *)path withFillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor
{
    UIImage *img;
    UIGraphicsBeginImageContextWithOptions(path.bounds.size, NO, 0.0);
    {
        if (fillColor) {
            [fillColor setFill];
            [path fill];
        }
        if (strokeColor) {
            [strokeColor setStroke];
            [path stroke];
        }
        
        img = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return img;
}

@end
