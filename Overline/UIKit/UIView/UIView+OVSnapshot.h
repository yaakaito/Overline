//
//  UIView+OVSnapshot.h
//  Overline
//
//  Created by Hari Karam Singh on 22/05/2014.
//  Copyright (c) 2014 Air Craft Media Ltd. MIT License.
//
//

#import <UIKit/UIKit.h>

@interface UIView (OVSnapshot)


/** Similar to snapshot... but uses the old <iOS7 layer renderInContext paradigm. */
- (UIImage *)renderAsImage;

/** Returns a UIImage snapshot using the new iOS7 `drawViewHierarchyInRect:...` method. Falls back to `renderAsImage` for <ios7.0 */
- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@end
