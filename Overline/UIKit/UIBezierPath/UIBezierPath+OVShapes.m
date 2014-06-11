//
//  UIBezierPath+OVShapes.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 05/06/2014.
//
//

#import <tgmath.h>
#import "UIBezierPath+OVShapes.h"

@implementation UIBezierPath (OVShapes)

+ (instancetype)bezierPathEquilaterialTriangleWithSideLength:(CGFloat)sideLength rotation:(CGFloat)rotation
{
    // Let's get the points based on having it centered (for the rotation)
    const CGFloat deg30 = M_PI/6.;
    const CGFloat L_2 = 0.5 * sideLength;
    CGPoint top = {0, L_2 / -cos(deg30)};
    CGPoint left = {-L_2, tan(deg30) * L_2};
    CGPoint right = {+L_2, tan(deg30) * L_2};
    
    UIBezierPath *path = [self bezierPath];
    [path moveToPoint:top];
    [path addLineToPoint:left];
    [path addLineToPoint:right];
    [path closePath];
    
    // Now rotate...
    if (rotation) {
        [path applyTransform:CGAffineTransformMakeRotation(rotation)];
    }
    
    // And adjust to be in the positive quadrant starting at 0,0
    CGAffineTransform tx = CGAffineTransformMakeTranslation(-path.bounds.origin.x, -path.bounds.origin.y);
    [path applyTransform:tx];
    
    return path;
}


@end
