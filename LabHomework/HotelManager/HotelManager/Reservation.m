//
//  Reservation.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/18/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "Reservation.h"
#import "AppDelegate.h"
#import "Guest.h"
#import "Rooms.h"
#import "NSManagedObject+NSManagedObjectContext.h"

@implementation Reservation

+ (instancetype)reservationWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate room:(Rooms *)room
{
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:[NSManagedObject managerContext]];
    
    reservation.startDate = startDate;
    reservation.endDate = endDate;
    reservation.rooms = room;
    
    return reservation;
}

@end
