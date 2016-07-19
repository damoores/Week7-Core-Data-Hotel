//
//  AvailabilityViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "AvailabilityViewController.h"
#import "AppDelegate.h"
#import "Reservation.h"
#import "Rooms.h"
#import "Hotel.h"
// #import "BookViewController.h"

@interface AvailabilityViewController ()

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *datasource;

@end

@implementation AvailabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor greenColor]];
}

- (NSArray *)datasource
{
    if (!_datasource) {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservations"];
        request.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate => %@", self.endDate, self.startDate];
        NSError *fetchError;
        NSArray *results = [delegate.managedObjectContext executeFetchRequest:request error:&fetchError];
        NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
        if (!fetchError) {
            for (Reservation *reservation in results) {
                [unavailableRooms addObject:reservation.rooms];
            }
        } else {
                NSLog(@"Error fetching reservations :%@",fetchError);
            }
        
        NSFetchRequest *checkRequest = [NSFetchRequest fetchRequestWithEntityName:@"Rooms"];
        checkRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN%@", unavailableRooms];
        NSArray *checkResults = [delegate.managedObjectContext executeFetchRequest:checkRequest error:&fetchError];
        if (fetchError) {
            NSLog(@"Error fetching rooms: %@", fetchError);
        } else {
            _datasource = checkResults;
        }
    }
    return _datasource;
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    
    //set tableView constraints
    NSLayoutConstraint
}
@end
