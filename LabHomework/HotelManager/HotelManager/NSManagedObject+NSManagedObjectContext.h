//
//  NSManagedObject+NSManagedObjectContext.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (NSManagedObjectContext)

+ (NSManagedObjectContext *)managerContext;

@end
