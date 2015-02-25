//
//  VPXAPI_UserManager.h
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VPXAPI_ResponseModel.h"
#import "VPXAPI_ErrorModel.h"

@class VPXAPI_UserManager;

@protocol VPXAPI_UserManagerDelegate <NSObject>
@optional


- (void)didAdd_activity:(VPXAPI_UserManager *)manager;
- (void)didFailToAdd_activity:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didEdit_activity:(VPXAPI_UserManager *)manager;
- (void)didFailToEdit_activity:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didSearch:(VPXAPI_UserManager *)manager;
- (void)didFailToSearch:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didLogin:(VPXAPI_UserManager *)manager;
- (void)didFailToLogin:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didReceiveEmail:(VPXAPI_UserManager *)manager;
- (void)didFailToReceiveEmail:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didSignup:(VPXAPI_UserManager *)manager;
- (void)didFailToSignup:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didResetPassword:(VPXAPI_UserManager *)manager;
- (void)didFailToResetPassword:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didLogout:(VPXAPI_UserManager *)manager;
- (void)didFailToLogout:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didUpdateProfile:(VPXAPI_UserManager *)manager;
- (void)didFailToUpdateProfile:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didCreateGallery:(VPXAPI_UserManager *)manager;
- (void)didFailToCreateGallery:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didGetGalleryContent:(VPXAPI_UserManager *)manager;
- (void)didFailToGetGalleryContent:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didAddActivityReview:(VPXAPI_UserManager *)manager;
- (void)didFailToAddActivityReview:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didEditActivityReview:(VPXAPI_UserManager *)manager;
- (void)didFailToEditActivityReview:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didPurchase:(VPXAPI_UserManager *)manager;
- (void)didFailToPurchase:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didGetChatMessage:(VPXAPI_UserManager *)manager;
- (void)didFailToGetChatMessage:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

- (void)didGetChatList:(VPXAPI_UserManager *)manager;
- (void)didFailToGetChatList:(VPXAPI_UserManager *)manager error:(VPXAPI_ErrorModel *)error;

@end

@interface VPXAPI_UserManager : VPXAPI_ResponseModel

@property (nonatomic, weak) id<VPXAPI_UserManagerDelegate> delegate;
@property (nonatomic, assign) int tagValue;

- (void)doAdd_activity:(NSDictionary *)params;
- (void)doSearch:(NSDictionary *)params;
- (void)doLogin:(NSDictionary *)params;
- (void)doForgetPassword:(NSString *)emailAddress;
- (void)doLogout:(NSString *)userId;
- (void)doResetPassword:(NSDictionary*)dictParams;
- (void)doSignup:(NSDictionary*)dictParams;
- (void)doCreateGallery:(NSDictionary*)dictParams;
- (void)doGetGalleryContent:(NSDictionary*)dictParams;
- (void)doUpdateProfile:(NSDictionary*)dictParams;
- (void)doAddActivityReview:(NSDictionary *)dictParams;
- (void)doEditActivityReview:(NSDictionary *)dictParams;
- (void)doPurchase:(NSDictionary *)dictParams;
- (void)doGetChatMessage:(NSDictionary *)dictParams;
- (void)doGetChatList:(NSDictionary *)dictParams;

@end
