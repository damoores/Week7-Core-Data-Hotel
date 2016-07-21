//
//  BookViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "BookViewController.h"
#import "NSManagedObject+NSManagedObjectContext.h"
#import "Flurry.h"

@interface BookViewController ()

@property (strong, nonatomic)UITextField *firstNameField;
@property (strong, nonatomic)UITextField *lastNameField;
@property (strong, nonatomic)UITextField *emailField;
@property (strong, nonatomic)UITextField *phoneNumberField;

@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
    [self setupBookViewController];
    [self setupMessageLabel];
    [self setupTextFields];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [Flurry logEvent:@"BookView appears"];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [Flurry logEvent:@"BookView disappears"];
}


- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor orangeColor]];
}

- (void)setupBookViewController
{
    [self.navigationItem setTitle:self.room.hotel.name];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

- (void)setupMessageLabel
{
    UILabel *messageLabel = [[UILabel alloc]init];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    messageLabel.text = [NSString stringWithFormat:@"Reservation at %@, Room: %@, From: %@ - To%@",self.room.hotel.name, self.room.number.stringValue, [NSDateFormatter localizedStringFromDate:self.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle], [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    [self.view addSubview:messageLabel];
    
    //set constraints
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    leading.active = YES;
    trailing.active = YES;
    centerY.active = YES;
}

- (void)setupTextFields
{
    self.firstNameField = [[UITextField alloc]init];
    self.firstNameField.placeholder = @" First Name";
    self.firstNameField.layer.cornerRadius = 4.0;
    self.firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastNameField = [[UITextField alloc]init];
    self.lastNameField.placeholder = @" Last Name";
    self.lastNameField.layer.cornerRadius = 4.0;
    self.lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.emailField = [[UITextField alloc]init];
    self.emailField.placeholder = @" email";
    self.emailField.layer.cornerRadius = 4.0;
    self.emailField.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneNumberField = [[UITextField alloc]init];
    self.phoneNumberField.placeholder = @" phone";
    self.phoneNumberField.layer.cornerRadius = 4.0;
    self.phoneNumberField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.firstNameField];
    [self.view addSubview:self.lastNameField];
    [self.view addSubview:self.emailField];
    [self.view addSubview:self.phoneNumberField];

    [self.firstNameField setBackgroundColor:[UIColor whiteColor]];
    [self.lastNameField setBackgroundColor:[UIColor whiteColor]];
    [self.emailField setBackgroundColor:[UIColor whiteColor]];
    [self.phoneNumberField setBackgroundColor:[UIColor whiteColor]];

    
    //set constraints
    NSLayoutConstraint *leadingFirst = [NSLayoutConstraint constraintWithItem:self.firstNameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:40.0];
    NSLayoutConstraint *trailingFirst = [NSLayoutConstraint constraintWithItem:self.firstNameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
    NSLayoutConstraint *topFirst = [NSLayoutConstraint constraintWithItem:self.firstNameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:104.0];
    
    NSLayoutConstraint *leadingLast = [NSLayoutConstraint constraintWithItem:self.lastNameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:40.0];
    NSLayoutConstraint *trailingLast = [NSLayoutConstraint constraintWithItem:self.lastNameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
    NSLayoutConstraint *topLast = [NSLayoutConstraint constraintWithItem:self.lastNameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.firstNameField attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0];

    NSLayoutConstraint *leadingEmail = [NSLayoutConstraint constraintWithItem:self.emailField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:40.0];
    NSLayoutConstraint *trailingEmail = [NSLayoutConstraint constraintWithItem:self.emailField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
    NSLayoutConstraint *topEmail = [NSLayoutConstraint constraintWithItem:self.emailField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.lastNameField attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *leadingPhone = [NSLayoutConstraint constraintWithItem:self.phoneNumberField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:40.0];
    NSLayoutConstraint *trailingPhone = [NSLayoutConstraint constraintWithItem:self.phoneNumberField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-40.0];
    NSLayoutConstraint *topPhone = [NSLayoutConstraint constraintWithItem:self.phoneNumberField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.emailField attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0];


    leadingFirst.active = YES;
    trailingFirst.active = YES;
    topFirst.active = YES;
    leadingLast.active = YES;
    trailingLast.active = YES;
    topLast.active = YES;
    leadingEmail.active = YES;
    trailingEmail.active = YES;
    topEmail.active = YES;
    leadingPhone.active = YES;
    trailingPhone.active = YES;
    topPhone.active = YES;
    
    [self.firstNameField becomeFirstResponder];
}


- (void)saveButtonSelected:(UIBarButtonItem *)sender
{
    Reservation *reservation = [Reservation reservationWithStartDate:self.startDate endDate:self.endDate room:self.room];
    self.room.reservation = reservation;
    reservation.guest = [Guest guestWithName:self.firstNameField.text lastName:self.lastNameField.text email:self.emailField.text phoneNumber:self.phoneNumberField.text];
    
    NSError *saveError;
    [[NSManagedObject managerContext] save:&saveError];
    
    if (saveError) {
        NSLog(@"Error saving reservation: %@", saveError);
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


@end


