//
//  UIImage+ImageUtil.m
//  IronMountain
//
//  Created by Ashwin Jumani on 02/03/13.
//  Copyright (c) 2013 Ashwin Jumani. All rights reserved.
//

#import "UIImage+ImageUtil.h"

@implementation UIImage (ImageUtil)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
