//
//  NSLayoutConstraint+OVConstructors.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 05/06/2014.
//
//

#import "NSLayoutConstraint+OVConstructors.h"

@implementation NSLayoutConstraint (OVConstructors)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Centering
/////////////////////////////////////////////////////////////////////////

+ (instancetype)constraintWithItemVerticallyCenteredInSuperview:(UIView *)aView
{
    return [NSLayoutConstraint constraintWithItem:aView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:aView.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
}

//---------------------------------------------------------------------

+ (instancetype)constraintWithItemHorizontallyCenteredInSuperview:(UIView *)aView
{
    return [NSLayoutConstraint constraintWithItem:aView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:aView.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
}

//---------------------------------------------------------------------

+ (NSArray *)constraintsWithItemCenteredInSuperview:(UIView *)aView
{
    return @[
             [self constraintWithItemHorizontallyCenteredInSuperview:aView],
             [self constraintWithItemVerticallyCenteredInSuperview:aView]
             ];
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - Alignment
/////////////////////////////////////////////////////////////////////////

+ (NSArray *)constraintsForAligningAttribute:(NSLayoutAttribute)attribute ofItems:(NSArray *)items
{
    NSMutableArray *constraints = [NSMutableArray array];
    
    for (int i=0; i<items.count-1; i++) {
        [constraints addObject:[NSLayoutConstraint
                                constraintWithItem:items[i]
                                attribute:attribute
                                relatedBy:NSLayoutRelationEqual
                                toItem:items[i+1]
                                attribute:attribute
                                multiplier:1
                                constant:0]
         ];
    }
    
    return [NSArray arrayWithArray:constraints];
}

//---------------------------------------------------------------------

+ (instancetype)constraintWithAttribute:(NSLayoutAttribute)attribute ofItem:(id)item1 offsetBy:(CGFloat)offset toItem:(id)item2
{
    return [NSLayoutConstraint constraintWithItem:item2 attribute:attribute  relatedBy:NSLayoutRelationEqual toItem:item1 attribute:attribute multiplier:1 constant:offset];
}


/////////////////////////////////////////////////////////////////////////
#pragma mark - Fixed Spacing
/////////////////////////////////////////////////////////////////////////

+ (instancetype)constraintWithHorizontalSpacing:(CGFloat)spacing betweenItem:(id)item1 andItem:(id)item2
{
    // Weird but this is how it needs to be...
    return [NSLayoutConstraint constraintWithItem:item2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:item1 attribute:NSLayoutAttributeTrailing multiplier:1 constant:spacing];
}

//---------------------------------------------------------------------

+ (NSArray *)constraintsWithHorizontalSpacing:(CGFloat)spacing betweenItems:(NSArray *)items
{
    NSMutableArray *constraints = [NSMutableArray array];
    for (int i=0; i<items.count-1; i++) {
        [constraints addObject:[self constraintWithHorizontalSpacing:spacing betweenItem:items[i] andItem:items[i+1]]];
    }
    return [NSArray arrayWithArray:constraints];
}

//---------------------------------------------------------------------

+ (instancetype)constraintWithVerticalSpacing:(CGFloat)spacing betweenItem:(id)item1 andItem:(id)item2
{
    // Weird but this is how it needs to be...
    return [NSLayoutConstraint constraintWithItem:item2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:item1 attribute:NSLayoutAttributeBottom multiplier:1 constant:spacing];
}

//---------------------------------------------------------------------

+ (NSArray *)constraintsWithVerticalSpacing:(CGFloat)spacing betweenItems:(NSArray *)items
{
    NSMutableArray *constraints = [NSMutableArray array];
    for (int i=0; i<items.count-1; i++) {
        [constraints addObject:[self constraintWithVerticalSpacing:spacing betweenItem:items[i] andItem:items[i+1]]];
    }
    return [NSArray arrayWithArray:constraints];
}


@end
