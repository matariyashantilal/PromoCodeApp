#import <Foundation/Foundation.h>

@interface Util : NSObject 
{
	
}

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

+ (UIColor *)toUIColor:(NSString *)ColorStr;

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 **     Get BOOL from an id value
 **/
+ (BOOL)boolFromValue:(id)value;

/**
 **     Check string if it's a valid email
 **/
+ (BOOL)validateEmail:(NSString *)strEmail;

/**
 **     Check string if it's a valid username
 **/

+ (BOOL) validateUsername: (NSString *) candidate;

/**
 ** Simple Alert.
 **/
+ (UIAlertView*)okAlert:(NSString*)title message:(NSString*)message;

+ (UIAlertView*)confirmAlert:(NSString*)title message:(NSString*)message withDelegate:(UIViewController*)delegate;


/**
 ** Used to clear cache so that facebook login screen appears
 ** after the user has logout of FB and logins again.
 **/
+ (void) cleanCookies:(NSString *)key;

//* To check isiOS7
+ (BOOL)isiOS7;

//* To Check_Device Orientation
+ (BOOL)isPortrait;

// Get regular fonts with size
+ (UIFont *)getRegularFontWithSize:(CGFloat)size;

//Get Bold font with size
+ (UIFont *)getBoldFontWithSize:(CGFloat)size;

//Get Light font with size
+ (UIFont *)getLightFontWithSize:(CGFloat)size;

+ (NSString*)getDiffInTime:(NSDate*)date;

+ (NSMutableArray *)getQuestionListFromPlistArray;

+ (BOOL)isUserAbleToAddThing;
+ (UIImage *)getSquareThumbnailImage:(UIImage *)imgOriginal;
+ (UIImage *)getCommentRectThumbnailImage:(UIImage *)imgOriginal;
+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width;
+ (UIImage *)getipadRectThumbnailImage:(UIImage *)imgOriginal;

+ (void)dismissKeyboard;
+ (void) globalResignFirstResponder;
+ (void) globalResignFirstResponderRec:(UIView*) view;

//+ (void)showPopupView:(UIViewController *)vc supportNavigation:(BOOL)isSupportNavigation;
+ (void)showPopupView:(UIViewController *)vc withSize:(CGSize)size;
+ (void)showPopupViewWithNavigation:(UINavigationController *)nav withSize:(CGSize)size;
+ (void)hidePoupView;
+ (void)removeFilesFromDocumentsDirectory;
+ (UIImage *)scaleAndRotateImage:(UIImage *)image ;
@end
