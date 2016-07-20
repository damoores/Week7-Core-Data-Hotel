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
#import "BookViewController.h"

@interface AvailabilityViewController ()

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *datasource;

@end

@implementation AvailabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
    [self setupTableView];
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
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
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
            // sorting by room number via Sung
            
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
            _datasource = [_datasource sortedArrayUsingDescriptors:@[sort]];
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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"roomCell"];
    
    //set tableView constraints
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    //activate constraints
    trailing.active = YES;
    leading.active = YES;
    top.active = YES;
    bottom.active = YES;
}

#pragma mark -- UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roomCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"roomCell"];
    }
    
    Rooms *room = self.datasource[indexPath.row];
    NSString *roomNumber = [room.number stringValue];
    NSString *roomBeds = [room.beds stringValue];
    NSString *roomRate = [room.rate stringValue];
    cell.textLabel.text = [NSString stringWithFormat:@"Room %@: %@ Beds, $%@ per night", roomNumber, roomBeds, roomRate];
    return cell;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImage *headerImage = [UIImage imageNamed:@"room"];
    UIImageView *headerView = [[UIImageView alloc]initWithImage:headerImage];
    
    headerView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 150.0);
    headerView.contentMode = UIViewContentModeScaleAspectFill;
    headerView.clipsToBounds = YES;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Rooms *room = self.datasource[indexPath.row];
    BookViewController *bookViewController = [[BookViewController alloc]init];
    bookViewController.room = room;
    bookViewController.startDate = self.startDate;
    bookViewController.endDate = self.endDate;
    [self.navigationController pushViewController:bookViewController animated:YES];
}

@end