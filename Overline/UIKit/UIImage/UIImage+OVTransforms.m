//
//  UIImage+OVTransforms.m
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 24/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import "UIImage+OVTransforms.h"

@implementation UIImage (OVTransforms)

- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
    // Get the bounds for the destination images
    CGRect imgRect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, CGAffineTransformMakeRotation(-radians));
    
    // Create the contedt with the correct scale
    UIGraphicsBeginImageContextWithOptions(rotatedRect.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Rotate the context around the centre and draw in he image
    CGContextTranslateCTM(ctx, rotatedRect.size.width/2, rotatedRect.size.height/2);
    CGContextRotateCTM(ctx, -radians);
    [self drawAtPoint:CGPointMake(-imgRect.size.width/2, -imgRect.size.height/2)];
    
    // Get the image to return and cleanup
    UIImage *rtnImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rtnImg;
}

//---------------------------------------------------------------------

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    return [self imageRotatedByRadians:degrees * (M_PI/180.0f)];
}

//---------------------------------------------------------------------

- (UIImage *)imageReflectedHorizontally
{
    return [self imageReflectedHorizontally:YES vertically:NO];
            
}

//---------------------------------------------------------------------

- (UIImage *)imageReflectedVertically
{
    return [self imageReflectedHorizontally:NO vertically:YES];
}

//---------------------------------------------------------------------

- (UIImage *)imageReflectedHorizontally:(BOOL)doHoriontal vertically:(BOOL)doVertical
{
    // Create the contedt with the correct scale
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Rotate the context around the centre and draw in he image
    CGContextScaleCTM(ctx,
                      doHoriontal ? -1.0 : +1.0,
                      doVertical ? -1.0 : +1.0);
    [self drawAtPoint:CGPointMake(doHoriontal ? -size.width : 0,
                                  doVertical ? -size.height: 0)];
    
    // Get the image to return and cleanup
    UIImage *rtnImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rtnImg;
}


@end
