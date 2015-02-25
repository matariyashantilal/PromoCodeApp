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

static NSString *const k_update_userLocation                                = @"updateUserLocation";



#define k_RT_Key_FilePath                                   @"filePath"

#define kVideoDirectory                                     @"Videos"

#define DOCUMENTS_DIRECTORY [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]




#define k_Password_Length           @"Password length cannot be less than 8 characters"
#define k_Password_Blank            @"Please enter password"
#define k_Username_Blank            @"Please enter Username"
#define k_Email_NotValid            @"Please enter valid email address"


#define DEBUG_MODE
#ifdef DEBUG_MODE
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else
#define DebugLog( s, ... )
#endif

static NSString *const k_NSNotificationCenter_UserDidLogin                  = @"User Did Login";
static NSString *const k_UserDefault_UserId                                 = @"UserID";
static NSString *const k_User_AuthToken                                     = @"authtoken";




#define k_Internet_Title            @"Internet Connection"
#define k_Internet_Message          @"It seems your internet connection is not active. Please check."
#define kUserDef_CurrentDeviceToken @"CurrentDeviceToken"
#define k_Internet_Now_Available    @"InternetNowAvailable"


//For Color
#define RGB(r, g, b) [UIColor colorWithRed:r/225.0f green:g/225.0f blue:b/225.0f alpha:1]

enum Content_Type
{
    Content_Type_Terms = 1,
    Content_Type_privacy = 2,
    Content_Type_About = 3
};
#endif

