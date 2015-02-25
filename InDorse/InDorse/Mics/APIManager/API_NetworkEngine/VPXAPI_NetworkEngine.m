//
//  VPXAPI_NetworkEngine.m
//  www.vprex.com
//
//  Created by Beniamin Boariu on 01/07/13.
//  Copyright (c) 2013 www.vprex.com. All rights reserved.
//

#import "VPXAPI_NetworkEngine.h"

@implementation VPXAPI_NetworkEngine

+ (id)sharedInstance
{
    static VPXAPI_NetworkEngine *sharedInstance;
    static dispatch_once_t done;
    
    dispatch_once(&done, ^{
        sharedInstance = [[VPXAPI_NetworkEngine alloc] initWithHostName:K_API_MAIN_HOST_NAME];
    });
//    [sharedInstance useCache];
    [sharedInstance emptyCache];
    
    return sharedInstance;
}

- (int)cacheMemoryCost
{
    return 0;
}

@end
