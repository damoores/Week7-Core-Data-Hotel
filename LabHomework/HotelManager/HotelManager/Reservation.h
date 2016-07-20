//
//  Reservation.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/18/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Rooms.h"

@class Guest, Rooms;

NS_ASSUME_NONNULL_BEGIN

@interface Reservation : NSManagedObject

+(instancetype)reservationWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate room:(Rooms *)room;

@end

NS_ASSUME_NONNULL_END

#import "Reservation+CoreDataProperties.h"
