//
//  HotelManagerTests.m
//  HotelManagerTests
//
//  Created by Jeremy Moore on 7/20/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSManagedObject+NSManagedObjectContext.h"

@interface HotelManagerTests : XCTestCase

@property (strong, nonatomic)NSManagedObjectContext *context;

@end

@implementation HotelManagerTests

- (void)setUp {
    [super setUp];
    [self setContext:[NSManagedObject managerContext]];
}

- (void)tearDown {
    [self setContext:nil];
    [super tearDown];
}

- (void)testContextSetup
{
    XCTAssertNotNil(self.context, @"Context should not be nil");
}

- (void)testCoreDataSave
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.resultType = NSCountResultType;
    
    NSArray *results = [self.context executeFetchRequest:request error:nil];
    NSNumber *count = [results firstObject];
    
    XCTAssertNotNil(results, @"Hotel enitities in storage should not be nil");
    XCTAssertTrue(count > 0, @"There should be hotels in storage");
}

@end
