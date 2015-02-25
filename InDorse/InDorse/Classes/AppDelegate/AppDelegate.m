//
//  AppDelegate.m
//  InDorse
//
//  Created by Kirti Parghi on 23/02/15.
//  Copyright (c) 2015 Kirti Parghi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self customizeNavBar];

    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark --
#pragma mark -- User defined methods

- (void)setNewLabelText:(NSString *)strLabelText andNewDescriptionText:(NSString *)strDescriptionText
{
    appDelegate().progressHUD.removeFromSuperViewOnHide = YES;
    appDelegate().progressHUD.labelText         = strLabelText;
    appDelegate().progressHUD.labelFont = [Util getRegularFontWithSize:14.0];
    appDelegate().progressHUD.detailsLabelText  = strDescriptionText;
    [appDelegate().progressHUD setNeedsDisplay];
}

- (void)initProgressHUD
{
    self.progressHUD = [[MBProgressHUD alloc] initWithWindow:self.window];
    self.progressHUD.mode = MBProgressHUDModeIndeterminate;
    self.progressHUD.removeFromSuperViewOnHide = YES;
}

#pragma mark - Reachability

- (BOOL)isInternetReachable
{
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    if ( [reach isReachable] )
    {
        return YES;
    }
    return NO;
}
#pragma mark -
#pragma mark - Customize Navigation Bar

- (void)customizeNavBar
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:45.0/255.0 green:180.0/255.0 blue:1.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor],
       NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:20.0f]}];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark -
#pragma mark - AoToHome

- (void)gotoMainHome
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //setup top view controller
    self.navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavHome"];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    //set window root view controller
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
}
- (void)updateUserLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    if([CLLocationManager locationServicesEnabled] == NO){
        NSLog(@"service Disable");
    }
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [[Util okAlert:@"Message" message:@"Please enable location service from settings."] show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    //CLLocation *newLocation = locations[[locations count] -1];
    //CLLocation *currentLocation = newLocation;
    
    self.strLatitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    self.strLongitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    
    [self.locationManager stopUpdatingHeading];
    self.locationManager.delegate = nil;
    [self.locationManager stopUpdatingLocation];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:k_update_userLocation object:self userInfo:nil];
    
}


- (void)gotoLogin
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //setup top view controller
    self.navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavLogin"];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    //set window root view controller
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
}


#pragma mark - Convenience Constructors

AppDelegate *appDelegate(void)
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
@end



