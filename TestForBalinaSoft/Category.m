//
//  Category.m
//  TestForBalinaSoft
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Category.h"

@implementation Category

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.offers = [NSMutableArray array];
    }
    
    return self;
}


- (void)addOffer:(Offer *) offer
{
    [self.offers addObject:offer];
}


@end
