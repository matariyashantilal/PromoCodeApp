//
//  TLShareManager.m
//  Thingealogy
//
//  Created by Nikhil Patel on 01/05/14.
//  Copyright (c) 2014 Ashwin Jumani. All rights reserved.
//

#import "TLShareManager.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

static TLShareManager* s_instance = nil;
@implementation TLShareManager

+ (TLShareManager*)sharedManager
{
	if ( nil == s_instance )
    {
		s_instance = [[TLShareManager alloc] init];
        
    }
	
	return s_instance;
}

- (void)shareOnEmail:(NSString*)message onViewController:(UIViewController*)vc;
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        [mailVC navigationBar].tintColor = [UIColor whiteColor];
        mailVC.mailComposeDelegate = vc;
        
        [mailVC setSubject:[NSString stringWithFormat:@"Angel Mail"]];
        
        [mailVC setMessageBody:message isHTML:YES];
        
        [vc presentViewController:mailVC animated:YES completion:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"No configured mail account found"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
}

- (void)shareOnSMS:(NSString*)message onViewController:(UIViewController*)vc;
{
    if ([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController *msgVC = [[MFMessageComposeViewController alloc] init];
        msgVC.messageComposeDelegate = vc;
        [msgVC navigationBar].tintColor = [UIColor whiteColor];
        [msgVC setBody:message];
        [vc presentViewController:msgVC animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Device cannot send the text messages"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    
}

- (void)shareOnEmailWithMessage:(NSString*)message emailID:(NSString *)emailID onViewController:(UIViewController*)vc
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        [mailVC navigationBar].tintColor = [UIColor whiteColor];
        mailVC.mailComposeDelegate = vc;
        
        [mailVC setSubject:[NSString stringWithFormat:@"Angel Mail"]];
        [mailVC setToRecipients:[NSArray arrayWithObjects:emailID, nil]];
        [mailVC setMessageBody:message isHTML:YES];
        
        [vc presentViewController:mailVC animated:YES completion:^{
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"No configured mail account found"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
}

- (void)shareOnSMSWithMessage:(NSString*)message number:(NSString *)number onViewController:(UIViewController*)vc
{
    if ([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController *msgVC = [[MFMessageComposeViewController alloc] init];
        msgVC.messageComposeDelegate = vc;
        [msgVC setRecipients:[NSArray arrayWithObjects:number, nil]];
        [msgVC navigationBar].tintColor = [UIColor whiteColor];
        [msgVC setBody:message];
        [vc presentViewController:msgVC animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Device cannot send the text messages"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    
}

@end

TLShareManager *shareSession(void)
{
    return [TLShareManager sharedManager];
}
