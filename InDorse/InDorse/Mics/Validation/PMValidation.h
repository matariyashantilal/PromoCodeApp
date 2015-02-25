//
//  PMValidation.h
//  ProfileManager
//
//  Created by Pratik Sharma on 16/12/13.
//  Copyright (c) 2013 Complitech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ValidationType) {
    ValidationTypeNullCheck = 0,
    ValidationTypeEmailCheck=1,
    ValidationTypeMinLength=2,
    ValidationTypeMaxLength=3,
    ValiadtePwdWithConfirmPwd=4
    
};

@interface PMValidation : NSObject
{
    
}

@property(nonatomic,assign) ValidationType valiadtionType NS_AVAILABLE_IOS(5_0);

+(BOOL)validateTextField:(UITextField *)textField :(NSString*)str :(ValidationType)type;

+(BOOL)validateTextField:(UITextField *)textField :(NSString*)str :(ValidationType)type :(int)Length;

+(BOOL)validateTextField:(UITextField *)textField :(UITextField *)textfiled1;

@end
