//
//  NSDictionary+Utility.m
//  OceanPal
//
//  Created by Beniamin Boariu on 7/18/12.
//  Copyright (c) 2012 www.brians.com. All rights reserved.
// 

#import "NSDictionary+Utility.h"

@implementation NSDictionary (Utility)

// in case of [NSNull null] values a nil is returned ...
- (id)objectForKeyNotNull:(id)key
{
    id object = [self objectForKey:key];
    if (object == [NSNull null])
        return nil;
    
    return object;
}

@end
