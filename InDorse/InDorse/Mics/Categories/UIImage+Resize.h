//
//  UIImage+Resize.h
//  OceanPal
//
//  Created by Aftab Baig on 2/22/13.
//  Copyright (c) 2013 www.brians.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

- (UIImage *)resizeToSize:(CGSize)newSize thenCropWithRect:(CGRect)cropRect;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
