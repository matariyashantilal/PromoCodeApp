//
//  IDHomeVC.m
//  InDorse
//
//  Created by Narvani Vishal on 25/02/15.
//  Copyright (c) 2015 Kirti Parghi. All rights reserved.
//

#import "IDHomeVC.h"
#import "Constants.h"

@interface IDHomeVC ()
{
    
}
@end

@implementation IDHomeVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [appDelegate() updateUserLocation];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLocation) name:k_update_userLocation object:nil];
    

}
- (void)updateLocation
{
    
    DLog(@"%@ %@",appDelegate().strLatitude,appDelegate().strLongitude);
}


@end
