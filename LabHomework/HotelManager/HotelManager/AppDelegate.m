//
//  AppDelegate.m
//  HotelManager
//
//  Created by Jeremy Moore on 7/18/16.
//  Copyright © 2016 Jeremy Moore. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Hotel.h"
#import "Rooms.h"
#import "Guest.h"
#import "Reservation.h"
#import "CoreDataStack.h"
#import "Flurry.h"

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupRootViewController];
    [[CoreDataStack shared]bootstrapApp];
    [Flurry startSession:@"RWZ56MXCNCZVRCBGHWYQ"];
    
    [Flurry logEvent:@"Application launched"];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [Flurry logEvent:@"Application Terminated"];
    [[CoreDataStack shared] saveContext];
}

- (void)setupRootViewController
{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.viewController = [[ViewController alloc]init];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
}


@end
