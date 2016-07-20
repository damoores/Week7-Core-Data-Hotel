//
//  RoomsViewController.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/18/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "RoomsViewController.h"
#import "Rooms.h"
#import "AppDelegate.h"
#import "Hotel.h"

@interface RoomsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *datasource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.datasource = [NSMutableArray arrayWithArray:[_hotel.rooms allObjects]];
    
// sorting by room number via Sung
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
    self.datasource = [self.datasource sortedArrayUsingDescriptors:@[sort]];
}


- (void)setupTableView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"roomCell"];
    self.tableView.backgroundColor = [UIColor greenColor];

    
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

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor greenColor];
    cell.contentView.backgroundColor = [UIColor greenColor];
}

@end
