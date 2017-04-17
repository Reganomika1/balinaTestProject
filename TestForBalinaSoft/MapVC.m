//
//  MapVC.m
//  TestForBalinaSoft
//
//  Created by Admin on 16.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MapVC.h"

@interface MapVC ()

@end

@implementation MapVC

- (instancetype)initWithAnnotation:(Annotation *) annotation
{
    self = [super init];
    
    if (self)
    {
        self.annotation = annotation;
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *_rightBarImage = [UIImage imageNamed:@"map.png"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:_rightBarImage
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(myLocation)];
    
    _locationManager = [[CLLocationManager alloc] init];
    
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
    [self.mapView addAnnotation:self.annotation];
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}


- (void) myLocation
{
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}


@end
