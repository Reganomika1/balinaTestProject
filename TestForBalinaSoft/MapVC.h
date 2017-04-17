//
//  MapVC.h
//  TestForBalinaSoft
//
//  Created by Admin on 16.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"


@interface MapVC : UIViewController
{
    CLLocationManager *_locationManager;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, strong) Annotation *annotation;


- (instancetype)initWithAnnotation:(Annotation *) annotation;


@end

