//
//  Offers.h
//  TestForBalinaSoft
//
//  Created by Admin on 15.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Offer.h"
#import "OfferDescription.h"
#import "SDWebImage/UIImageView+WebCache.h"

#define OCellIdentifier @"OfferCell"

@interface Offers : UITableViewController
{
    NSMutableData *_imageData;
}

@property(strong, nonatomic) NSArray *offers;

- (instancetype)initWithOffers:(NSArray *) offers;


@end
