//
//  InfoViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "InfoViewController.h"
#import "Flurry.h"
#import "ConstraintHelper.h"

@interface InfoViewController ()

@property (strong, nonatomic)UITextView *infoLabel;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [Flurry logEvent:@"InfoView appears"];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [Flurry logEvent:@"InfoView disappears"];
}


- (void)loadView
{
    [super loadView];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"cyberdyne"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:backgroundImage];
    
    imageView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:imageView];
    self.view.backgroundColor = [UIColor magentaColor];
    
    self.infoLabel = [[UITextView alloc]init];
    self.infoLabel.text = [NSString stringWithFormat:NSLocalizedString(@"C&H Properties is a wholly owned subsidary of Skynet. All Rights Reserved.",nil)];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    [self.infoLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [self.infoLabel setBackgroundColor:[UIColor clearColor]];
    self.infoLabel.frame = CGRectMake(20.0, 84.0, (CGRectGetWidth(self.view.frame)*0.90), 60.0);
    [self.view addSubview:self.infoLabel];
}

@end
