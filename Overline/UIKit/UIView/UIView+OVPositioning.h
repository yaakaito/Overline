//
//  UIView+OVPositioning.h
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 25/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.

#import <UIKit/UIKit.h>

/** Shorthand and convenience methods for view positioning and size */
@interface UIView (OVPositioning)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Frame get/set shorthand
/////////////////////////////////////////////////////////////////////////

/** Frame origin/size */
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Bounds shorthand
/////////////////////////////////////////////////////////////////////////

@property (nonatomic, assign) CGSize boundsSize;
@property (nonatomic, assign) CGFloat boundsWidth;
@property (nonatomic, assign) CGFloat boundsHeight;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Additional setters
/////////////////////////////////////////////////////////////////////////

/** Centers view in superview.
 @throws NSGenericException if superview = nil */
- (void)alignCenterHorizontally;

/** Centers view in superview.
 @throws NSGenericException if superview = nil */
- (void)alignCenterVertically;

/** Centers view in superview.
 @throws NSGenericException if superview = nil */
- (void)alignCenter;

/** Aligns right edge to that of the superview.
 @throws NSGenericException if superview = nil */
- (void)alignRight;

/** Aligns bottom edge to that of the superview.
 @throws NSGenericException if superview = nil */
- (void)alignBottom;

/** Layout with respect to the superview. 
    @throws NSGenericException if superview = nil */
- (void)setMargins:(UIEdgeInsets)margins;

/** Positions the view a given distance from the bottom boundary of the superview changing the frame origin (as opposed to the size)
    @throws NSGenericException if superview = nil */
- (void)setBottomMargin:(CGFloat)bottom;

@end
