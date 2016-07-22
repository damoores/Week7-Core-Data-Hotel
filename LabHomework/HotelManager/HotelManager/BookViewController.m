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
#import "ConstraintHelper.h"

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
    [ConstraintHelper setupLabel:messageLabel superView:self.view text:[NSString stringWithFormat:NSLocalizedString(@"Reservation at %@, Room: %@, From: %@ - To%@",nil),self.room.hotel.name, self.room.number.stringValue, [NSDateFormatter localizedStringFromDate:self.startDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle], [NSDateFormatter localizedStringFromDate:self.endDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]]];

    //set constraints
    [ConstraintHelper centerY:messageLabel superView:self.view];
}

- (void)setupTextFields
{
    
    UITextField *firstNameField = [[UITextField alloc]init];
    [ConstraintHelper setupUITextField:firstNameField superView:self.view name:@"First Name"];
    UITextField *lastNameField = [[UITextField alloc]init];
    [ConstraintHelper setupUITextField:lastNameField superView:self.view name:@"LastName"];
    UITextField *emailField = [[UITextField alloc]init];
    [ConstraintHelper setupUITextField:emailField superView:self.view name:@"Email"];
    UITextField *phoneNumberField = [[UITextField alloc]init];
    [ConstraintHelper setupUITextField:phoneNumberField superView:self.view name:@"Phone Number"];
    
    
    //set constraints TODO:
    
    for (UIView *view in self.view.subviews)
    {
        [ConstraintHelper setLeading:view superView:self.view multiplier:@1.0 constant:@40.0];
        [ConstraintHelper setTrailing:view superView:self.view multiplier:@1.0 constant:@-40.0];
    }
    
    [ConstraintHelper setTopToTop:firstNameField superView:self.view multiplier:@1.0 constant:@104.0];
    [ConstraintHelper setTopToBottom:lastNameField superView:firstNameField multiplier:@1.0 constant:@20.0];
    [ConstraintHelper setTopToBottom:emailField superView:lastNameField multiplier:@1.0 constant:@20.0];
    [ConstraintHelper setTopToBottom:phoneNumberField superView:emailField multiplier:@1.0 constant:@20.0];
    
    [firstNameField becomeFirstResponder];
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


