//
//  MyAnnotationClass.h
//  PolygonOverlaySample
//
//  Created by shawn on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>


@interface MyAnnotationClass : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D carCoordinate;
}

@property (nonatomic, assign) CLLocationCoordinate2D carCoordinate;

@property (nonatomic, retain) NSArray *arrCurrentCar;

- (id)initWithCoordinate:(CLLocationCoordinate2D)d_c_coordinate;

- (CLLocationCoordinate2D)coordinate;
//- (MKMapItem*)mapItem;

@end
