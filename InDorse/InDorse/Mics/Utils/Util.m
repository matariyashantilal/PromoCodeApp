

#import "Util.h"
#include <sys/xattr.h>


@implementation Util

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

#pragma mark - Image and Color

+ (UIColor *)toUIColor:(NSString *)ColorStr
{
    unsigned int c;
    if ([ColorStr characterAtIndex:0] =='#')
    {
        [[NSScanner scannerWithString:[ColorStr substringFromIndex:1]] scanHexInt:&c];
    } 
    else 
    {
        [[NSScanner scannerWithString:ColorStr] scanHexInt:&c];
    }
    return [UIColor colorWithRed:((c & 0xff0000) >> 16)/255.0 green:((c & 0xff00) >> 8)/255.0 blue:(c & 0xff)/255.0 alpha:1.0];
}

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect 
{
	CGImageRef sourceImageRef = [image CGImage];
	CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
	UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
	CGImageRelease(newImageRef);
	return newImage;
}

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
	UIGraphicsBeginImageContext( newSize );
	[image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

+ (BOOL)boolFromValue:(id)value
{
    if ([value isKindOfClass:[NSString class]])
    {
        NSString *strValue      = (NSString *)value;
        if ([strValue isEqualToString:@"1"])
        {
            return TRUE;
        }
        else
            if ([strValue isEqualToString:@"0"])
            {
                return FALSE;
            }
    }
    
    return FALSE;
}

+ (BOOL) validateEmail: (NSString *) candidate
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

+ (BOOL) validateUsername: (NSString *) candidate
{
    NSString *usernameRegex = @"[A-Za-z][A-Za-z0-9_.]{3,31}";
    NSPredicate *usernameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", usernameRegex];
    
    return [usernameTest evaluateWithObject:candidate];
}


+ (UIAlertView*)okAlert:(NSString*)title message:(NSString*)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    return alertView;
}
+ (UIAlertView*)confirmAlert:(NSString*)title message:(NSString*)message withDelegate:(UIViewController*)delegate
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:delegate
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes",nil];
    return alertView;
}

+ (void)dismissKeyboard
{
    [self globalResignFirstResponder];
}

+ (void) globalResignFirstResponder {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    for (UIView * view in [window subviews]){
        [self globalResignFirstResponderRec:view];
    }
}

+ (void) globalResignFirstResponderRec:(UIView*) view {
    if ([view respondsToSelector:@selector(resignFirstResponder)]){
        [view resignFirstResponder];
    }
    for (UIView * subview in [view subviews]){
        [self globalResignFirstResponderRec:subview];
    }
}


+ (void) cleanCookies:(NSString *)key
{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies])
    {
        NSString* domainName = [cookie domain];
        //NSLog(@"domain-name: %@", domainName);
        NSRange domainRange = [domainName rangeOfString:key];
        if(domainRange.length > 0)
        {
            [storage deleteCookie:cookie];
        }
    }
}

+ (BOOL)isiOS7
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
        return YES;
    else
        return NO;
}

+ (BOOL)isPortrait
{
    
    return  UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation]);
    
    /*
    if ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationMaskPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown || [[UIDevice currentDevice]orientation] == UIInterfaceOrientationPortrait || [[UIDevice currentDevice]orientation] == UIInterfaceOrientationPortraitUpsideDown)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    */
}

+ (UIFont *)getRegularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Raleway" size:size];
}
+ (UIFont *)getBoldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Raleway-Bold" size:size];
}
+ (UIFont *)getLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Raleway-Thin" size:size];
}

+ (NSString*)getDiffInTime:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];

    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    //DebugLog(@"Current Time : %@\n POST TIME : %@", dateFromString, date);

    int difference = [dateFromString timeIntervalSinceDate:date];
  //  [dateFromString timeIntervalSince1970] - date.timeIntervalSince1970;

    int hh = 0, mm = 0, ss = 0;
    
    if (difference < 0)
    {
        ss = 0;
        if (ss == 1) {
            return [NSString stringWithFormat:@"%i second ago",ss];
        }else{
            return [NSString stringWithFormat:@"%i seconds ago",ss];
        }
    }
    
    if(difference < 60)
    {
        ss = difference;
        if (ss == 1) {
            return [NSString stringWithFormat:@"%i second ago",ss];
        }else{
            return [NSString stringWithFormat:@"%i seconds ago",ss];
        }
    }
    else if(difference/60 < 60)
    {
        mm = difference/60;
        //ss = difference % 60;
        if (mm == 1) {
            return [NSString stringWithFormat:@"%i minute ago",mm];
        }else{
            return [NSString stringWithFormat:@"%i minutes ago",mm];
        }
    }
    else if (difference/3600 < 24)
    {
        mm = difference/60;
        hh = mm/60;
        //mm = mm%60;
        //ss = difference%3600;
        if (hh == 1) {
            return [NSString stringWithFormat:@"%i hour ago",hh];
        }else{
            return [NSString stringWithFormat:@"%i hours ago",hh];
        }
    }
    else if (difference/86400 <= 31)
    {
        mm = difference/86400;
//        hh = mm/60;
//        mm = mm%60;
//        ss = difference%3600;
        
        if (mm == 1) {
            return [NSString stringWithFormat:@"%i day ago",mm];
        }else{
            return [NSString stringWithFormat:@"%i days ago",mm];
        }
    }
    else if ((difference/86400)/30 <= 12)
    {
        mm = (difference/86400) / 30;
        
        if (mm == 1) {
            return [NSString stringWithFormat:@"%i month ago",mm];
        }
        else{
            return [NSString stringWithFormat:@"%i months ago",mm];
        }
    }
    else
    {
        mm = ((difference/86400) / 30) / 12;
        
        if (mm == 1) {
            return [NSString stringWithFormat:@"%i year ago",mm];
        }
        else{
            return [NSString stringWithFormat:@"%i years ago",mm];
        }
    }
    return @"";
}

+ (NSMutableArray *)getQuestionListFromPlistArray
{
    NSString *appDetailPlist = [[NSBundle mainBundle] pathForResource:@"Help" ofType:@"plist"];
    
    return [NSMutableArray arrayWithContentsOfFile:appDetailPlist];
}


+ (UIImage *)getSquareThumbnailImage:(UIImage *)imgOriginal
{
    if (imgOriginal.size.height> imgOriginal.size.width)
    {
        CGRect cropRect = CGRectMake(0,(imgOriginal.size.height - imgOriginal.size.width)/2, imgOriginal.size.width, imgOriginal.size.width);
        CGImageRef imageRef = CGImageCreateWithImageInRect([imgOriginal  CGImage], cropRect);
        // or use the UIImage wherever you like
        // return [UIImage imageWithCGImage:imageRef];
        imgOriginal = [UIImage imageWithCGImage:imageRef];
    }
    else if (imgOriginal.size.height< imgOriginal.size.width)
    {
        CGRect cropRect = CGRectMake((imgOriginal.size.width - imgOriginal.size.height)/2,0, imgOriginal.size.height, imgOriginal.size.height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([imgOriginal  CGImage], cropRect);
        // or use the UIImage wherever you like
        //return [UIImage imageWithCGImage:imageRef];
        imgOriginal = [UIImage imageWithCGImage:imageRef];
    }
    return imgOriginal;
}

+ (UIImage *)getCommentRectThumbnailImage:(UIImage *)imgOriginal
{

    CGFloat xpoint = (imgOriginal.size.width/2) - 150;
    CGFloat ypoint = (imgOriginal.size.height/2) - 50;
    CGRect cropRect = CGRectMake(xpoint, ypoint, 300, 100);
    CGImageRef imageRef = CGImageCreateWithImageInRect([imgOriginal  CGImage], cropRect);
        // or use the UIImage wherever you like
        // return [UIImage imageWithCGImage:imageRef];
    imgOriginal = [UIImage imageWithCGImage:imageRef];
     return imgOriginal;
}

+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage *)getipadRectThumbnailImage:(UIImage *)imgOriginal
{
    CGFloat xpoint = (imgOriginal.size.width/2) - 107;
    CGFloat ypoint = (imgOriginal.size.height/2) - 35;
    CGRect cropRect = CGRectMake(xpoint, ypoint, 215, 70);
    CGImageRef imageRef = CGImageCreateWithImageInRect([imgOriginal  CGImage], cropRect);
    imgOriginal = [UIImage imageWithCGImage:imageRef];
    return imgOriginal;
}

+ (void)removeFilesFromDocumentsDirectory
{
    NSString *extension = @"wav";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    while ((filename = [e nextObject])) {
        
        if ([[filename pathExtension] isEqualToString:extension]) {
            
            [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:filename] error:NULL];
        }
    }
}

+ (UIImage *)scaleAndRotateImage:(UIImage *)image {
    int kMaxResolution = 640; // Or whatever
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = roundf(bounds.size.width / ratio);
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = roundf(bounds.size.height * ratio);
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}
@end