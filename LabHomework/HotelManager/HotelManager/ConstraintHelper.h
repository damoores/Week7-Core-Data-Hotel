//
//  ConstraintHelper.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/21/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConstraintHelper : NSLayoutConstraint

+ (void)setFullScreen:(UIView *)subView superView:(UIView *)superView;
+ (void)setLeading:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant;
+ (void)setTrailing:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant;
+ (void)setTopToTop:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant;
+ (void)setTopToBottom:(UIView *)subView superView:(UIView *)superView multiplier:(NSNumber *)multiplier constant:(NSNumber *)constant;
+ (void)setupUITextField:(UITextField *)textField superView:(UIView *)superView name:(NSString *)name;
+ (void)setupLabel:(UILabel *)label superView:(UIView *)superView text:(NSString *)text;
+ (void)centerY:(UIView *)subview superView:(UIView *)superView;

@end
