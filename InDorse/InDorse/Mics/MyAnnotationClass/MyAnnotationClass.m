//
//  MyAnnotationClass.m
//  PolygonOverlaySample
//
//  Created by shawn on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyAnnotationClass.h"


@implementation MyAnnotationClass

- (id)initWithCoordinate:(CLLocationCoordinate2D)d_c_coordinate
{
     if ((self = [super init])) {
         self.carCoordinate = d_c_coordinate;
     }
    
    return self;
}

- (CLLocationCoordinate2D)coordinate {
    return self.carCoordinate;
}

//- (MKMapItem*)mapItem {
//    NSDictionary *addressDict = @{(NSString*)kABPersonAddressStreetKey : self.carType};
//    
//    MKPlacemark *placemark = [[MKPlacemark alloc]
//                              initWithCoordinate:self.coordinate
//                              addressDictionary:addressDict];
//    
//    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//    mapItem.name = self.title;
//    
//    return mapItem;
//}

@end
