//
//  Guest.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "NSManagedObject+NSManagedObjectContext.h"


@class Reservation;

NS_ASSUME_NONNULL_BEGIN

@interface Guest : NSManagedObject


+ (instancetype)guestWithName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email phoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END

#import "Guest+CoreDataProperties.h"
