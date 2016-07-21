//
//  NSManagedObject+NSManagedObjectContext.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/19/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "NSManagedObject+NSManagedObjectContext.h"
#import "AppDelegate.h"
#import "CoreDataStack.h"

@implementation NSManagedObject (NSManagedObjectContext)

+ (NSManagedObjectContext *)managerContext
{
    return [[CoreDataStack shared]managedObjectContext];
}

@end
