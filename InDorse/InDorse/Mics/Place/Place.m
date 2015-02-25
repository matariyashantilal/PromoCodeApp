//
//  Place.m
//  Miller
//
//  Created by kadir pekel on 2/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Place.h"


@implementation Place

@synthesize catname;
@synthesize name;
@synthesize userpinimgid;
@synthesize days;
@synthesize description;
@synthesize latitude;
@synthesize longitude;
@synthesize arrCurrentCar;

- (void) dealloc
{
	[name release];
	[description release];
	[super dealloc];
}

@end
