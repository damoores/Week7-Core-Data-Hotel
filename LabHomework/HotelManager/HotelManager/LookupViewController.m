//
//  LookupViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/20/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "LookupViewController.h"
#import "Reservation.h"
#import "Guest.h"
#import "Rooms.h"
#import "Hotel.h"
#import "NSManagedObject+NSManagedObjectContext.h"
#import "Flurry.h"

@interface LookupViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSArray *datasource;

@end

@implementation LookupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [Flurry logEvent:@"LookupView appears"];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [Flurry logEvent:@"LookupView disappears"];
}


- (void)loadView
{
    [super loadView];
    [self setupTableView];
    [self setTitle:@"Search"];
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"roomCell"];
    self.tableView.backgroundColor = [UIColor yellowColor];
    
    //setup TableView constraints
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

-(void)setDatasource:(NSArray *)datasource
{
    _datasource = datasource;
    [self.tableView reloadData];
}

#pragma mark TableView datasource

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
    Reservation *reservation = self.datasource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Name: %@ %@, Hotel: %@", reservation.guest.firstName, reservation.guest.lastName, reservation.rooms.hotel.name];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

#pragma mark TableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 44.0)];
    searchBar.delegate = self;
    return searchBar;
}

#pragma mark searchBar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchText = searchBar.text;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    request.predicate = [NSPredicate predicateWithFormat:@"guest.firstName == %@ || guest.lastName == %@",searchText, searchText];
    NSError *error;
    NSArray *results = [[NSManagedObject managerContext]executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Error fetching reservations: %@", error);
    } else {
        self.datasource = results;
    }
}

@end
