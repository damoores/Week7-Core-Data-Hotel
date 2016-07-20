//
//  ComingSoonViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "ComingSoonViewController.h"

@interface ComingSoonViewController ()

@end

@implementation ComingSoonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadView
{
    [super loadView];
    UIImage *backgroundImage = [UIImage imageNamed:@"Coming-soon"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:backgroundImage];
    
    imageView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    [self.view addSubview:imageView];
    self.view.backgroundColor = [UIColor yellowColor];
}

@end
