        //
//  VPXAPI_UserManager.m
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import "VPXAPI_UserManager.h"

@implementation VPXAPI_UserManager


- (void)doAdd_activity:(NSDictionary *)params
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_add_activity
                                                              params:params
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didAdd_activity:)])
            {
                [self.delegate didAdd_activity:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToAdd_activity:error:)])
            {
                [self.delegate didFailToAdd_activity:self error:self.error];
            }
        }
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToAdd_activity:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToAdd_activity:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

/**     Search to the system using Patient Survey
 **     @dictParams contains the information required to authenticate.
 **/
- (void)doSearch:(NSDictionary *)params
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_Search
                                                              params:params
                                                          httpMethod:kHTTP_GET_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didSearch:)])
            {
                [self.delegate didSearch:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToSearch:error:)])
            {
                [self.delegate didFailToSearch:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToSearch:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToSearch:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}


/**     Login to the system using Patient Survey
 **     @dictParams contains the information required to authenticate.
 **/
- (void)doLogin:(NSDictionary*)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_Login
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
         
         NSDictionary *dictJSON = completedOperation.responseJSON;
         [self handleResponse:dictJSON];
         
         if (self.error == nil)
         {
             if (self.delegate && [self.delegate respondsToSelector:@selector(didLogin:)])
             {
                 [self.delegate didLogin:self];
             }
         }
         else
         {
             if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToLogin:error:)])
             {
                 [self.delegate didFailToLogin:self error:self.error];
             }
         }
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
         
         if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToLogin:error:)])
         {
             self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
             [self.delegate didFailToLogin:self error:self.error];
         }
     }];
    
    [networkEngine enqueueOperation:operation];
}



/**     Logout user from the system
 **     @userId is used to identify the user on server.
 **/
- (void)doLogout:(NSString*)userId
{
    NSDictionary *dictParams = @{@"authentication_token": userId}; // [NSDictionary dictionaryWithObject:userId forKey:@"authentication_token"];
    
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_Logout
                                                              params:dictParams
                                                          httpMethod:kHTTP_GET_Method];
    
    //DebugLog(@"Logout : %@",[operation description]);
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
         
         NSDictionary *dictJSON = completedOperation.responseJSON;
         [self handleResponse:dictJSON];
         
         if (self.error == nil)
         {
             if (self.delegate && [self.delegate respondsToSelector:@selector(didLogout:)])
             {
                 [self.delegate didLogout:self];
             }
         }
         else
         {
             if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToLogout:error:)])
             {
                 [self.delegate didFailToLogout:self error:self.error];
             }
         }
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error){
         
         if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToLogout:error:)])
         {
             self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
             [self.delegate didFailToLogout:self error:self.error];
         }
     }];
    
    [networkEngine enqueueOperation:operation];
}

/**     Signup to the system using Patient Survey
 **     @dictParams contains the information required to authenticate.
 **/
- (void)doSignup:(NSDictionary*)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_Signup
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didSignup:)])
            {
                [self.delegate didSignup:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToSignup:error:)])
            {
                [self.delegate didFailToSignup:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToSignup:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToSignup:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}


/**
 **     Send a forget-password request
 **     @emailAddress is the email on which the new password will be sent
 **/
- (void)doForgetPassword:(NSString *)emailAddress
{
    
    NSDictionary *dictParams = [NSDictionary dictionaryWithObject:emailAddress forKey:@"email"];
    
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_ForgetPassword
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didReceiveEmail:)])
            {
                [self.delegate didReceiveEmail:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToReceiveEmail:error:)])
            {
                [self.delegate didFailToReceiveEmail:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToReceiveEmail:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToReceiveEmail:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}



- (void)doResetPassword:(NSDictionary*)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_ResetPassword
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didResetPassword:)])
            {
                [self.delegate didResetPassword:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToResetPassword:error:)])
            {
                [self.delegate didFailToResetPassword:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToResetPassword:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToResetPassword:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

- (void)doUpdateProfile:(NSDictionary *)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_UpdateProfile
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didUpdateProfile:)])
            {
                [self.delegate didUpdateProfile:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToUpdateProfile:error:)])
            {
                [self.delegate didFailToUpdateProfile:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToUpdateProfile:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToUpdateProfile:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}
- (void)doCreateGallery:(NSDictionary*)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_Create_Gallery
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didCreateGallery:)])
            {
                [self.delegate didCreateGallery:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToCreateGallery:error:)])
            {
                [self.delegate didFailToCreateGallery:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToCreateGallery:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToCreateGallery:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

- (void)doGetGalleryContent:(NSDictionary*)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_Show_Gallery
                                                              params:dictParams
                                                          httpMethod:kHTTP_GET_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didGetGalleryContent:)])
            {
                [self.delegate didGetGalleryContent:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToGetGalleryContent:error:)])
            {
                [self.delegate didFailToGetGalleryContent:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToGetGalleryContent:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToGetGalleryContent:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

- (void)doAddActivityReview:(NSDictionary *)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_add_activity
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didAddActivityReview:)])
            {
                [self.delegate didAddActivityReview:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToAddActivityReview:error:)])
            {
                [self.delegate didFailToAddActivityReview:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToAddActivityReview:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToAddActivityReview:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];

}

- (void)doEditActivityReview:(NSDictionary *)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_EditActivity_Review
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didEditActivityReview:)])
            {
                [self.delegate didEditActivityReview:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToEditActivityReview:error:)])
            {
                [self.delegate didFailToEditActivityReview:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToEditActivityReview:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToEditActivityReview:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

- (void)doGetChatList:(NSDictionary *)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_GetChatList
                                                              params:dictParams
                                                          httpMethod:kHTTP_GET_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didGetChatList:)])
            {
                [self.delegate didGetChatList:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToGetChatList:error:)])
            {
                [self.delegate didFailToGetChatList:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToGetChatList:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToGetChatList:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

- (void)doGetChatMessage:(NSDictionary *)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_GetChatMessage
                                                              params:dictParams
                                                          httpMethod:kHTTP_GET_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didGetChatMessage:)])
            {
                [self.delegate didGetChatMessage:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToGetChatMessage:error:)])
            {
                [self.delegate didFailToGetChatMessage:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToGetChatMessage:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToGetChatMessage:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

- (void)doPurchase:(NSDictionary *)dictParams
{
    VPXAPI_NetworkEngine *networkEngine = [VPXAPI_NetworkEngine sharedInstance];
    MKNetworkOperation *operation = [networkEngine operationWithPath:k_API_User_Purchase
                                                              params:dictParams
                                                          httpMethod:kHTTP_POST_Method];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSDictionary *dictJSON = completedOperation.responseJSON;
        [self handleResponse:dictJSON];
        
        if (self.error == nil)
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didPurchase:)])
            {
                [self.delegate didPurchase:self];
            }
        }
        else
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToPurchase:error:)])
            {
                [self.delegate didFailToPurchase:self error:self.error];
            }
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailToPurchase:error:)])
        {
            self.error = [[VPXAPI_ErrorModel alloc] initWithError:error];
            [self.delegate didFailToPurchase:self error:self.error];
        }
    }];
    
    [networkEngine enqueueOperation:operation];
}

@end
