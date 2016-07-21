//
//  Operations.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/20/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "Operations.h"
#import "Hotel.h"
#import "Guest.h"
#import "Rooms.h"
#import "Reservation.h"
#import "NSManagedObject+NSManagedObjectContext.h"

@interface Operations ()

@property (strong, nonatomic)NSArray *availableDatasource;


@end


@implementation Operations


+ (NSArray *)availableRooms:(NSDate *)endDate startDate:(NSDate *)startDate
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSArray *checkResults;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    request.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate => %@", endDate, startDate];
    NSError *fetchError;
    NSArray *results = [delegate.managedObjectContext executeFetchRequest:request error:&fetchError];
    NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
    if (!fetchError) {
        for (Reservation *reservation in results) {
            [unavailableRooms addObject:reservation.rooms];
        }
    } else {
        NSLog(@"Error fetching reservations :%@",fetchError);
    }
    
    NSFetchRequest *checkRequest = [NSFetchRequest fetchRequestWithEntityName:@"Rooms"];
    checkRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN%@", unavailableRooms];
    checkResults = [delegate.managedObjectContext executeFetchRequest:checkRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching rooms: %@", fetchError);
    } else {
        // sorting by room number via Sung
        
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
        checkResults = [checkResults sortedArrayUsingDescriptors:@[sort]];
    }
return checkResults;
}






@end
