//
//  Place.h
//  Miller
//
//  Created by kadir pekel on 2/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Place : NSObject
{
    NSString* catname;
	NSString* name;
    NSString* userpinimgid;
    int days;
	NSString* description;
	double latitude;
	double longitude;
    NSArray *arrCurrentCar;
}
@property (nonatomic, retain) NSString* catname;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* userpinimgid;
@property (nonatomic, assign) int days;
@property (nonatomic, retain) NSString* description;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic,retain) NSArray *arrCurrentCar;

@end
