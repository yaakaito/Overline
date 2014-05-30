//
//  UIImage+OVTransforms.h
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 24/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OVTransforms)

/** Returns a new image which is this one rotated by the specified angle.  NOT THREAD SAFE: Call form the main thread only */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/** Convenience method for degree rotations.  See imageRotatedByRadians: */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;


@end
