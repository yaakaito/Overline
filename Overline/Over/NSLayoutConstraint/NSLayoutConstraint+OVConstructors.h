//
//  NSLayoutConstraint+OVConstructors.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 05/06/2014.
//
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (OVConstructors)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Centering
/////////////////////////////////////////////////////////////////////////

/** A constraint for vertical center alignment of an item to it's superview */
+ (instancetype)constraintWithItemVerticallyCenteredInSuperview:(UIView *)aView;

/** A constraint for horizontal center alignment of an item to it's superview */
+ (instancetype)constraintWithItemHorizontallyCenteredInSuperview:(UIView *)aView;

/** Constraints for center alignment on both axes */
+ (NSArray *)constraintsWithItemCenteredInSuperview:(UIView *)aView;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Alignment
/////////////////////////////////////////////////////////////////////////

/** Constraints array for equal alignment of a single attribute on multiple items (e.g. align vertical centers with NSLayoutAtributeCenterY)  */
+ (NSArray *)constraintsForAligningAttribute:(NSLayoutAttribute)attribute ofItems:(NSArray *)items;

/** Shorthand for a simple offset of two items wrt a single attribute. E.g. uilabel center vertically aligned to an image with an offset of 2 */
+ (instancetype)constraintWithAttribute:(NSLayoutAttribute)attribute ofItem:(id)item1 offsetBy:(CGFloat)offset toItem:(id)item2;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Fixed Spacing
/////////////////////////////////////////////////////////////////////////

+ (instancetype)constraintWithHorizontalSpacing:(CGFloat)spacing betweenItem:(id)item1 andItem:(id)item2;

+ (NSArray *)constraintsWithHorizontalSpacing:(CGFloat)spacing betweenItems:(NSArray *)items;

+ (instancetype)constraintWithVerticalSpacing:(CGFloat)spacing betweenItem:(id)item1 andItem:(id)item2;

+ (NSArray *)constraintsWithVerticalSpacing:(CGFloat)spacing betweenItems:(NSArray *)items;





@end
