//
//  VPXAPI_ErrorModel.h
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VPXAPI_ErrorModel : NSObject

@property (nonatomic, strong) NSString *errorCode;
@property (nonatomic, strong) NSString *message;

- (id)initWithDictionary:(NSDictionary*)dictResult;
- (id)initWithError:(NSError*)error;
- (id)initWithMessage:(NSString *)message;

@end
