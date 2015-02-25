//
//  AppDelegate.h
//  InDorse
//
//  Created by Kirti Parghi on 23/02/15.
//  Copyright (c) 2015 Kirti Parghi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "UIImage+ImageUtil.h"
#import "MBProgressHUD.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSString          *deviceToken;
@property (nonatomic, strong) NSUserDefaults    *defaults;
@property (nonatomic, retain) NSString    *authToken;

//=>     Global reference to progressHUD. We will use it as hud in every screen
@property (nonatomic, strong) MBProgressHUD *progressHUD;

@property (nonatomic, retain) CLLocation *userLocation;

@property (nonatomic, retain) NSString *strLatitude;
@property (nonatomic, retain) NSString *strLongitude;

- (BOOL)isInternetReachable;
- (void)gotoHome;
- (void)gotoLogin;
- (void)updateUserLocation;

- (void)setNewLabelText:(NSString *)strLabelText andNewDescriptionText:(NSString *)strDescriptionText;

@end

AppDelegate *appDelegate(void);