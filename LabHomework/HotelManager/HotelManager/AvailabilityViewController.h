//
//  AvailabilityViewController.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvailabilityViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)NSDate *startDate;
@property (strong, nonatomic)NSDate *endDate;

@end
