//
//  UIButton+Util.m
//  AngelMail
//
//  Created by Chhaya on 27/10/14.
//  Copyright (c) 2014 Complitech. All rights reserved.
//

#import "UIButton+Util.h"

@implementation UIButton (Util)

-(NSString *)fontName
{
    return self.titleLabel.font.fontName;
}

-(void)setFontName : (NSString *)fontname
{
    self.titleLabel.font = [UIFont fontWithName:fontname size:self.titleLabel.font.pointSize];
}

@end
