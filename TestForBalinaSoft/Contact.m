//
//  Contact.m
//  TestForBalinaSoft
//
//  Created by Admin on 17.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithAdress:(NSString *) adress phoneNumber:(NSString *) phoneNumber andLocation:(CLLocationCoordinate2D) location
{
    self = [super init];
    
    if (self)
    {
        self.adress = adress;
        
        self.phoneNumber = phoneNumber;
        
        self.location = location;
    }
    
    return self;
}


@end
