//
//  Operations.h
//  HotelManager
//
//  Created by Jeremy Moore on 7/20/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operations : NSObject

+ (NSArray *)availableRooms:(NSDate *)endDate startDate:(NSDate *)startDate;

@end
