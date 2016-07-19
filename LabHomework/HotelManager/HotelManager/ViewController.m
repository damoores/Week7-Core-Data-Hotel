//
//  ViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/18/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "ViewController.h"
#import "HotelsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupCustomLayout];
}

- (void)setupViewController
{
    [self.navigationItem setTitle:@"H & M"];
}

- (void)setupCustomLayout
{
//    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [[UIButton alloc]init];
    UIButton *bookButton = [[UIButton alloc]init];
    UIButton *lookUpButton = [[UIButton alloc]init];

    [browseButton setTitle:@"Browse Hotels" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book Now!" forState:UIControlStateNormal];
    [lookUpButton setTitle:@"My Reservations" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor greenColor]];
    [bookButton setBackgroundColor:[UIColor redColor]];
    [lookUpButton setBackgroundColor:[UIColor yellowColor]];
    
    [browseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lookUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookUpButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:browseButton];
    [self.view addSubview:bookButton];
    [self.view addSubview:lookUpButton];
    
    //browseButton
    NSLayoutConstraint *browseButtonLeading = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];

    NSLayoutConstraint *browseButtonTrailing = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *browseButtonTop = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:64.0];
    
    NSLayoutConstraint *browseButtonHeight = [NSLayoutConstraint constraintWithItem:browseButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0.0];
    
    //bookButton
    NSLayoutConstraint *bookButtonLeading = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookButtonTrailing = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookButtonTop = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:browseButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookButtonHeight = [NSLayoutConstraint constraintWithItem:bookButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:browseButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];

    //lookUpButton
    NSLayoutConstraint *lookUpButtonLeading = [NSLayoutConstraint constraintWithItem:lookUpButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookUpButtonTrailing = [NSLayoutConstraint constraintWithItem:lookUpButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookUpButtonTop = [NSLayoutConstraint constraintWithItem:lookUpButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bookButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookUpButtonHeight = [NSLayoutConstraint constraintWithItem:lookUpButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:browseButton attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    // Activate Constraints
    browseButtonLeading.active = YES;
    browseButtonTrailing.active = YES;
    browseButtonTop.active = YES;
    browseButtonHeight.active = YES;

    bookButtonLeading.active = YES;
    bookButtonTrailing.active = YES;
    bookButtonTop.active = YES;
    bookButtonHeight.active = YES;

    lookUpButtonLeading.active = YES;
    lookUpButtonTrailing.active = YES;
    lookUpButtonTop.active = YES;
    lookUpButtonHeight.active = YES;
    
    //Setup button actions
    [browseButton addTarget:self action:@selector(browseButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [lookUpButton addTarget:self action:@selector(lookUpButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)browseButtonSelected:(UIButton *)sender
{
    [self.navigationController pushViewController:[[HotelsViewController alloc]init] animated:YES];
}

- (void)bookButtonSelected:(UIButton *)sender
{
    //TODO: add action
}

- (void)lookUpButtonSelected:(UIButton *)sender
{
    //TODO: add action
}

@end




