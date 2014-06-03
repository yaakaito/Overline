//
//  UIView+OVSnapshot.m
//  Overline
//
//  Created by Hari Karam Singh on 22/05/2014.
//  Copyright (c) 2014 Air Craft Media Ltd. MIT License.
//

#import "UIView+OVSnapshot.h"

@implementation UIView (OVSnapshot)

- (UIImage *)renderAsImage
{
    UIImage *snapshotImage;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    {
        [self.layer.presentationLayer renderInContext:UIGraphicsGetCurrentContext()];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}

//---------------------------------------------------------------------

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return [self renderAsImage];
    } else {
        
        UIImage *snapshotImage;
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
        {
            [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
            snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        }
        UIGraphicsEndImageContext();
        
        return snapshotImage;
    }
}
@end
