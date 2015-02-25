//
//  VPXAPI_ErrorModel.m
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import "VPXAPI_ErrorModel.h"
#import "VPXAPI_Constants.h"

@implementation VPXAPI_ErrorModel

/**
 **     Initialize Error with @dictResult dictionary
 **     @dictResult is the dictionary that contains error-code and related error-messages.
 **/
- (id)initWithDictionary:(NSDictionary *)dictResult
{
    self = [super init];
    if (self)
    {
        self.errorCode  = [dictResult objectForKey:kAPI_Response_Result_ErrorCode];
        self.message    = [dictResult objectForKey:kAPI_Response_Message];
    }
    return self;
}

/**
 **     Initialize with @error
 **/
- (id)initWithError:(NSError*)error
{
    self = [super init];
    if (self)
    {
        self.errorCode  = [NSString stringWithFormat:@"%d",[error code]];
        self.message    = error.localizedDescription;
    }
    return self;
}

/**
 **     Initialize with @message
 **/
- (id)initWithMessage:(NSString *)message
{
    self = [super init];
    if (self)
    {
        self.errorCode = @"0";
        self.message = message;
    }
    return self;
}

/**
 **     Describe the error
 **     Used in log statements
 **/
- (NSString*)description
{
    return self.message;
}

@end
