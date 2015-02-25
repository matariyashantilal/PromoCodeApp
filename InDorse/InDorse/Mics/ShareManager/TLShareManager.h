//
//  TLShareManager.h
//  Thingealogy
//
//  Created by Nikhil Patel on 01/05/14.
//  Copyright (c) 2014 Ashwin Jumani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface TLShareManager : NSObject <MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

+ (TLShareManager*)sharedManager;

- (void)shareOnEmail:(NSString*)message onViewController:(UIViewController*)vc;
- (void)shareOnSMS:(NSString*)message onViewController:(UIViewController*)vc;
- (void)shareOnEmailWithMessage:(NSString*)message emailID:(NSString *)emailID onViewController:(UIViewController*)vc;
- (void)shareOnSMSWithMessage:(NSString*)message number:(NSString *)number onViewController:(UIViewController*)vc;
@end

/* convenience */
TLShareManager *shareSession(void);