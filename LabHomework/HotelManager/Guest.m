//
//  Guest.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "Guest.h"
#import "Reservation.h"


@implementation Guest

+ (instancetype)guestWithName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email phoneNumber:(NSString *)phoneNumber
{
    Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:[NSManagedObject managerContext]];
    
    guest.firstName = firstName;
    guest.lastName = lastName;
    guest.email = email;
    guest.phoneNumber = phoneNumber;
    return guest;
}

@end
