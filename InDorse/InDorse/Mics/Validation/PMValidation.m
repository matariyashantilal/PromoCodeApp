//
//  PMValidation.m
//  ProfileManager
//
//  Created by Pratik Sharma on 16/12/13.
//  Copyright (c) 2013 Complitech. All rights reserved.
//

#import "PMValidation.h"

@implementation PMValidation


+(BOOL)validateTextField:(UITextField *)textField :(NSString*)str :(ValidationType)type
{

        NSString *msgStr = @"Please enter ";
        UIAlertView *message ;
    
        msgStr=[msgStr stringByAppendingString:str];
    
        NSString *trimmedString = [textField.text stringByTrimmingCharactersInSet:
                                  [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
        textField.text = trimmedString;
    
        if ([textField.text isEqualToString:@""])
        {
             message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:msgStr
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [message show];
        
        
            return YES;
        }

    if (type==ValidationTypeEmailCheck)
    {
        msgStr=@"Enter Valid Email Address";
        
        NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        bool result= [emailTest evaluateWithObject:textField.text];
    
        if (!result)
        {
            
        
            message = [[UIAlertView alloc] initWithTitle:@"Email address invaild"
                                                          message:msgStr
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [message show];
            return YES;
        }
        
        
        
        
    }
    return NO;
    
}

+(BOOL)validateTextField:(UITextField *)textField :(NSString*)str :(ValidationType)type :(int)Length
{
    NSString *msgStr;
    UIAlertView *message;
    
    NSString *trimmedString = [textField.text stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    textField.text = trimmedString;

    if (type==ValidationTypeMinLength)
    {
        msgStr =[NSString stringWithFormat:@"Minimum length of %@ is %d",str,Length];
        if (textField.text.length<Length) {
            message = [[UIAlertView alloc] initWithTitle:@"Invaild length"
                                                 message:msgStr
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
            [message show];
            return YES;

        }
    }
    
    if (type==ValidationTypeMaxLength)
    {
        msgStr =[NSString stringWithFormat:@"Maximum length of %@ should be %d",str,Length];
        if (textField.text.length>Length) {
            message = [[UIAlertView alloc] initWithTitle:@"Invaild length"
                                                 message:msgStr
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
            [message show];
            return YES;
            
        }
    }

    
    return NO;
}



+(BOOL)validateTextField:(UITextField *)textFieldPwd :(UITextField *)textFieldConfirmPwd
{
    NSString *msgStr=@"Confirm Password should match with Password";
    UIAlertView *message;
    

    if (![[textFieldPwd text] isEqualToString:[textFieldConfirmPwd text]])
    {
        message = [[UIAlertView alloc] initWithTitle:@"Passwords are not matching"
                                             message:msgStr
                                            delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil];
        [message show];

        return YES;
    }
    return NO;
}

@end




