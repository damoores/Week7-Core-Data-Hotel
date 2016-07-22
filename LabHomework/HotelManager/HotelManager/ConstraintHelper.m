//
//  ConstraintHelper.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/21/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "ConstraintHelper.h"

@implementation ConstraintHelper

+ (void)setFullScreen:(UIView *)subView superView:(UIView *)superView
{
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    trailing.active = YES;
    leading.active = YES;
    top.active = YES;
    bottom.active = YES;
}

+ (void)setLeading:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant
{
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeading multiplier:[multiplier floatValue] constant:[constant floatValue]];
    leading.active = YES;

}

+ (void)setTrailing:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant
{
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTrailing multiplier:[multiplier floatValue] constant:[constant floatValue]];
    trailing.active = YES;
}

+ (void)setTopToTop:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant
{
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:[multiplier floatValue] constant:[constant floatValue]];
    top.active = YES;
}

+ (void)setTopToBottom:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant
{
    NSLayoutConstraint *topToBottom = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:[multiplier floatValue] constant:[constant floatValue]];
    
    topToBottom.active = YES;
    
}

+ (void)setupUITextField:(UITextField *)textField superView:(UIView *)superView name:(NSString *)name
{
    textField.placeholder = [NSString stringWithFormat:NSLocalizedString(name, nil)];
    textField.layer.cornerRadius = 4.0;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.backgroundColor = [UIColor whiteColor];
    [superView addSubview:textField];
}

+ (void)setupLabel:(UILabel *)label superView:(UIView *)superView text:(NSString *)text
{
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = text;
    [superView addSubview:label];

}

+ (void)centerY:(UIView *)subview superView:(UIView *)superView
{
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    centerY.active = YES;
}

@end
