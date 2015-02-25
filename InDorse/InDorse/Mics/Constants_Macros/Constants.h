//
//  Constants.h
//  DrumApp
//
//  Created by Ashwin Jumani on 03/04/14.
//  Copyright (c) 2014 Complitech. All rights reserved.
//


#ifndef DA_Constants_h
#define DA_Constants_h

#define DEBUG_MODE
#ifdef DEBUG_MODE
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else
#define DebugLog( s, ... )
#endif


#define isIpad                      ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IS_IPHONE5                   ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


//>---------------------------------------------------------------------------------------------------
//>     User defined constants for NSNotificationCenter
//>---------------------------------------------------------------------------------------------------
/**
 **     Key used to post a notification, when push notif arrived
 **/


/**
 **     Key used to post a notification, when user did logout
 **/
static NSString *const k_NSNotificationCenter_UserDidLogout                 = @"User Did Logout";
static NSString *const k_PN_Angel_Received                                  = @"AngelReceived";


// Constants for Speed Values
#define k_Min_Speed  40
#define k_Max_Speed  208

#define k_RT_Key_FilePath                                   @"filePath"

#define kVideoDirectory                                     @"Videos"

#define DOCUMENTS_DIRECTORY [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]

#define VIDEO_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Videos"]

#define DEBUG_MODE
#ifdef DEBUG_MODE
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else
#define DebugLog( s, ... )
#endif

static NSString *const k_NSNotificationCenter_UserDidLogin                  = @"User Did Login";
static NSString *const k_UserDefault_UserId                                 = @"UserID";
static NSString *const k_User_AuthToken                                     = @"authtoken";

static NSString *const k_User_Location = @"location";

static NSString *const k_admin_disease_list                                 = @"diseaseList";


#define k_Internet_Title            @"Internet Connection"
#define k_Internet_Message          @"It seems your internet connection is not active. Please check."
#define kUserDef_CurrentDeviceToken @"CurrentDeviceToken"
#define k_Internet_Now_Available    @"InternetNowAvailable"


#define k_InAppPurchase_Success @"successPurchase"
#define k_InAppPurchase_Failed @"failedPurchase"
#define k_Refresh_UpgradeView @"refreshUpgrade"


#define k_Collection_ImageIcon_Name @"icon_no_image.png"
#define k_Thing_ImageIcon_Name @"noimg_large.png"

#define k_Inapp_UnlimitedChat @"net.complitech.chat"
#define k_Inapp_SecureMedia @"net.complitech.media"

//For Color
#define RGB(r, g, b) [UIColor colorWithRed:r/225.0f green:g/225.0f blue:b/225.0f alpha:1]

enum Content_Type
{
    Content_Type_Terms = 1,
    Content_Type_privacy = 2,
    Content_Type_About = 3
};
#endif

