//
//  BookViewController.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rooms.h"
#import "Hotel.h"
#import "Reservation.h"
#import "Guest.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic)NSDate *startDate;
@property (strong, nonatomic)NSDate *endDate;
@property (strong, nonatomic)Rooms *room;

@end
