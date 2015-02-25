//
//  VPXAPI_ResponseModel.m
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import "VPXAPI_ResponseModel.h"

@implementation VPXAPI_ResponseModel

/**
 **     A common method to handle the response.
 **     @dictResponse is the response dictionary that needs to be parsed.
 **     properties @error and @data are populated based on the response.
 **/
- (void)handleResponse:(NSDictionary *)dictResponse
{
    NSDictionary *result        = [dictResponse objectForKey:kAPI_Response_Result];
    
    if ([[result objectForKey:kAPI_Response_Result_Status] intValue] == 0)
    {
        self.error              = [[VPXAPI_ErrorModel alloc] initWithDictionary:result];
        self.data               = nil;
    }
    else
    {
        self.error              = nil;
        self.optionalMessage    = [result objectForKeyNotNull:kAPI_Response_Message];
        self.data               = [dictResponse objectForKey:kAPI_Response_Data];
    }
}

@end
