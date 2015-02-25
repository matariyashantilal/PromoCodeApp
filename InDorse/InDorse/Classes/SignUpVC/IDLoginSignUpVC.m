//
//  IDLoginSignUpVC.m
//  InDorse
//
//  Created by Narvani Vishal on 24/02/15.
//  Copyright (c) 2015 Kirti Parghi. All rights reserved.
//

#import "IDLoginSignUpVC.h"

#import "Constants.h"


@interface IDLoginSignUpVC ()
{
    IBOutlet UITextField *txtFieldEmail;
    IBOutlet UITextField *txtFieldPwd;

}
@end


@implementation IDLoginSignUpVC


#pragma mark --
#pragma mark -- view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

}


#pragma mark --
#pragma mark -- button actions

- (IBAction)actionLoginSignUp:(id)sender
{
    [self validateFields];
}

- (IBAction)actionForgetPwd:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"This is an example alert!" delegate:self cancelButtonTitle:@"Hide" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

#pragma mark --
#pragma mark -- user defined methods

- (void)validateFields
{
    NSString *Message;
    
    txtFieldEmail.text = [txtFieldEmail.text stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceCharacterSet]];
    
    if([txtFieldPwd.text length] < 8)
    {
        Message = k_Password_Length;
    }
    if([txtFieldPwd.text length]==0)
    {
        Message = k_Password_Blank;
    }
    if([txtFieldEmail.text length]==0)
    {
        Message = k_Username_Blank;
    }
    
    if([txtFieldEmail.text length]!=0)
    {
        
        NSArray *Emailspilt= [txtFieldEmail.text componentsSeparatedByString:@"@"];
        if([Emailspilt count]==1)
        {
            Message = k_Email_NotValid;
        }
        else
        {
            NSString *strcheck = [Emailspilt objectAtIndex:1];
            NSArray *checkValidation = [strcheck componentsSeparatedByString:@"."];
            if([checkValidation count]==1)
            {
                Message = k_Email_NotValid;
            }
        }
    }
    if([Message length]!=0)
    {
        UIAlertView *alert = [Util okAlert:@"Attention" message:Message];
        [alert show];
    }
    else
    {
        if([appDelegate() isInternetReachable])
        {
            //=>    Show progress HUD
            [appDelegate() setProgressHUD:[MBProgressHUD showHUDAddedTo:appDelegate().window animated:YES]];
            [appDelegate() setNewLabelText:@"Log in" andNewDescriptionText:@"Please Wait..."];
            NSDictionary* dictParams;
            
            dictParams = @{
                           @"user[email]"     :   [txtFieldEmail.text lowercaseString],
                           @"user[password]"  :   txtFieldPwd.text
                           };
            
            VPXAPI_UserManager *userManager     = [[VPXAPI_UserManager alloc] init];
            userManager.delegate                = self;
            [userManager doLogin:dictParams];
            
        }
        else
        {
            [[Util okAlert:k_Internet_Title message:k_Internet_Message] show];
        }
    }
}

#pragma mark --
#pragma mark -- VPXAPI_UserManager Delegate

- (void)didLogin:(VPXAPI_UserManager *)manager
{
    //=>     Hide progressHUD
    [appDelegate().progressHUD hide:YES];
    if(manager.data != nil)
    {
        NSDictionary *dict = (NSDictionary *)manager.data;
        [appDelegate().defaults setObject:[dict valueForKey:@"auth_token"] forKey:@"auth_token"];
        [appDelegate().defaults synchronize];
        [appDelegate() gotoMainHome];
    }
}

- (void)didFailToLogin:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error
{
    [[Util okAlert:@"Error" message:error.message] show];
    //=>     Hide progressHUD
    [appDelegate().progressHUD hide:YES];
}

#pragma mark --
#pragma mark -- UITextField Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField == txtFieldEmail) {
        [txtFieldPwd becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
        
        [self validateFields];
    }
    
    
    return YES;
}

- (void)resignAllResponder
{
    [txtFieldEmail resignFirstResponder];
    [txtFieldPwd resignFirstResponder];
}

@end
