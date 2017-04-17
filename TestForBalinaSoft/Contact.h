//  Contact.h
//  TestForBalinaSoft

//  Created by Admin on 17.04.17.
//  Copyright © 2017 Admin. All rights reserved.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Contact : NSObject

@property(strong, nonatomic) NSString *adress;
@property(strong, nonatomic) NSString *phoneNumber;
@property(assign, nonatomic) CLLocationCoordinate2D location;

- (instancetype)initWithAdress:(NSString *) adress phoneNumber:(NSString *) phoneNumber andLocation:(CLLocationCoordinate2D) location;


@end
