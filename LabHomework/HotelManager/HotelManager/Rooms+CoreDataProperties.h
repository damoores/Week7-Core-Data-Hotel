//
//  Rooms+CoreDataProperties.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/21/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Rooms.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rooms (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *beds;
@property (nullable, nonatomic, retain) NSNumber *number;
@property (nullable, nonatomic, retain) NSDecimalNumber *rate;
@property (nullable, nonatomic, retain) Hotel *hotel;
@property (nullable, nonatomic, retain) Reservation *reservation;

@end

NS_ASSUME_NONNULL_END
