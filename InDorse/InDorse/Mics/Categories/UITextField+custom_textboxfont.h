//
//  UITextField+custom_textboxfont.h
//  Boudoir
//
//  Created by Dipak Baraiya on 17/04/14.
//  Copyright (c) 2014 Ashwin Jumani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (custom_textboxfont)

-(NSString *)fontName;
-(void)setFontName : (NSString *)fontname;
//- (void)drawPlaceholderInRect:(CGRect)rect;
- (CGRect)textRectForBounds:(CGRect)bounds;
- (CGRect)editingRectForBounds:(CGRect)bounds;
@end
