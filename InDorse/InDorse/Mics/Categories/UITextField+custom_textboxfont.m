//
//  UITextField+custom_textboxfont.m
//  Boudoir
//
//  Created by Dipak Baraiya on 17/04/14.
//  Copyright (c) 2014 Ashwin Jumani. All rights reserved.
//

#import "UITextField+custom_textboxfont.h"

@implementation UITextField (custom_textboxfont)

-(NSString *)fontName
{
    return self.font.fontName;
}

-(void)setFontName : (NSString *)fontname
{
    self.font = [UIFont fontWithName:fontname size:self.font.pointSize];
}
/*

- (void)drawPlaceholderInRect:(CGRect)rect
{
    UIColor *colour = [UIColor colorWithRed:188.0/255.0 green:172.0/255.0 blue:122.0/255.0 alpha:1.0];
    if ([self.placeholder respondsToSelector:@selector(drawInRect:withAttributes:)])
    {
        // iOS7 and later
        NSDictionary *attributes = @{NSForegroundColorAttributeName: colour, NSFontAttributeName: self.font};
        CGRect boundingRect = [self.placeholder boundingRectWithSize:rect.size options:0 attributes:attributes context:nil];
        [self.placeholder drawAtPoint:CGPointMake(10, (rect.size.height/2)-boundingRect.size.height/2) withAttributes:attributes];
    }
    else
    { // iOS 6
        [colour setFill];
        [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:self.textAlignment];
    }
}
 
 */

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y,
                      bounds.size.width, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [self textRectForBounds:bounds];
}

@end
