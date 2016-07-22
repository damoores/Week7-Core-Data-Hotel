//
//  DateViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"
#import "Flurry.h"


@interface DateViewController ()

@property (strong, nonatomic)UIDatePicker *startPicker;
@property (strong, nonatomic)UIDatePicker *endPicker;
@property (strong, nonatomic)UILabel *startPickerLabel;
@property (strong, nonatomic)UILabel *endPickerLabel;

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDateViewController];
    [self setupDatePickers];
    [self setupLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [Flurry logEvent:@"DateView appears"];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [Flurry logEvent:@"DateView disappears"];
}


- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor orangeColor]];
}

- (void)setupDateViewController
{
    [self.navigationItem setTitle:[NSString stringWithFormat:NSLocalizedString(@"Select Dates", nil)] ];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:[NSString stringWithFormat:NSLocalizedString(@"Book Now!", nil)]  style:UIBarButtonItemStylePlain target:self action:@selector(bookNowButtonSelected:)]];

}

- (void)setupDatePickers
{
    self.startPicker =[[UIDatePicker alloc]init];
    self.startPicker.datePickerMode = UIDatePickerModeDate;
    self.startPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:86400];
    self.endPicker =[[UIDatePicker alloc]init];
    self.endPicker.datePickerMode = UIDatePickerModeDate;
    self.endPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:172800];

    self.startPicker.frame = CGRectMake(0.0, 124.0, CGRectGetWidth(self.view.frame), 160.0);
    self.endPicker.frame = CGRectMake(0.0, 364.0, CGRectGetWidth(self.view.frame), 160.0);

    [self.view addSubview:_startPicker];
    [self.view addSubview:_endPicker];
    
    [self.startPicker addTarget:self action:@selector(startDateChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setupLabels
{
    self.startPickerLabel = [[UILabel alloc]init];
    self.startPickerLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Set Check-in Date", nil)] ;
    self.startPickerLabel.textAlignment = NSTextAlignmentCenter;
    self.startPickerLabel.frame = CGRectMake(0.0, 84.0, CGRectGetWidth(self.view.frame), 40.0);
    self.endPickerLabel = [[UILabel alloc]init];
    self.endPickerLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Set Check-out Date", nil)] ;
    self.endPickerLabel.textAlignment = NSTextAlignmentCenter;
    self.endPickerLabel.frame = CGRectMake(0.0, 324.0, CGRectGetWidth(self.view.frame), 40.0);

    [self.view addSubview:_startPickerLabel];
    [self.view addSubview:_endPickerLabel];
}

- (void)bookNowButtonSelected:(UIBarButtonItem *)sender
{
    NSDate *startDate = [self.startPicker date];
    NSDate *endDate = [self.endPicker date];
    
    AvailabilityViewController *availabilityViewController = [[AvailabilityViewController alloc]init];
    availabilityViewController.startDate = startDate;
    availabilityViewController.endDate = endDate;
    [self.navigationController pushViewController:availabilityViewController animated:YES];
}

- (void)startDateChanged:(UIDatePicker *)sender
{
    NSDate *startDate = [self.startPicker date];
    [self.endPicker setDate:[NSDate dateWithTimeInterval:86400 sinceDate:startDate] animated:YES];
    
}
@end
