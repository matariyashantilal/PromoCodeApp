//
//  IAPObject.m
//  Ripple Training
//
//  Created by Ashwin Jumani on 25/10/13.
//  Copyright (c) 2012 Brians.com. All rights reserved.
//

#import "IAPObject.h"
#import "Constants.h"

@implementation IAPObject


static IAPObject * _sharedHelper;

+ (IAPObject *) sharedHelper {
    
    if (_sharedHelper != nil) {
        return _sharedHelper;
    }
    _sharedHelper = [[IAPObject alloc] init];
    return _sharedHelper;
    
}

- (id)init {
    
    NSSet *productIdentifiers = [NSSet setWithObjects:nil];

    
    if ((self = [super initWithProductIdentifiers:productIdentifiers]))
    {
        
    }
    return self;
    
}


@end
