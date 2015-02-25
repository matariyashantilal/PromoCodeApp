//
//  VPXAPI_ResponseModel.h
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VPXAPI_ErrorModel.h"

@interface VPXAPI_ResponseModel : NSObject

@property (strong, nonatomic) VPXAPI_ErrorModel *error;
@property (strong, nonatomic) NSString *optionalMessage;
@property (strong, nonatomic) id data;

- (void)handleResponse:(NSDictionary *)dictResponse;

@end
