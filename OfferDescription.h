//
//  OfferDescription.h
//  TestForBalinaSoft
//
//  Created by Admin on 15.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Offer.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface OfferDescription : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *decriptionLabel;
@property(strong, nonatomic) Offer *offer;


- (instancetype)initWithOffer:(Offer *) offer;


@end
