//
//  Category.h
//  TestForBalinaSoft
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Offer.h"

@interface Category : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *categoryId;
@property(strong, nonatomic) NSString *imageName;
@property(strong, nonatomic) NSMutableArray *offers;


- (void)addOffer:(Offer *) offer;


@end
