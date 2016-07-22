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
#import "Operations.h"
#import "Flurry.h"
#import "ConstraintHelper.h"

@interface AvailabilityViewController ()

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *datasource;


@end

@implementation AvailabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadView];
    [self setupTableView];
    [Flurry logEvent:@"AvailabilityView launched"];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
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
      _datasource = [Operations availableRooms:self.endDate startDate:self.startDate];
    
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
    self.tableView.backgroundColor = [UIColor orangeColor];
    
    //set tableView constraints
    [ConstraintHelper setFullScreen:self.tableView superView:self.view];
    
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
    cell.textLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Room %@: %@ Beds, $%@ per night",nil),roomNumber, roomBeds, roomRate];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor orangeColor];
    cell.contentView.backgroundColor = [UIColor orangeColor];
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
    [Flurry logEvent:@"AvailabilityView finished"];
    [self.navigationController pushViewController:bookViewController animated:YES];
}


@end
