//
//  OfferDescription.m
//  TestForBalinaSoft
//
//  Created by Admin on 15.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "OfferDescription.h"

@interface OfferDescription ()

@end

@implementation OfferDescription

- (instancetype)initWithOffer:(Offer *) offer
{
    self = [super init];
    
    if (self)
    {
        self.offer = offer;
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Карта блюда";
    
    if([self.offer.imageUrl isEqualToString:@""])
    {
        self.imageView.image = [UIImage imageNamed:@"no_photo.png"];
    }
    else
    {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.offer.imageUrl]
                          placeholderImage:[UIImage imageNamed:@"no_photo.png"]];
    }
    
    self.nameLabel.text = self.offer.name;
    
    if(self.offer.weight == nil)
    {
        self.weightLabel.text = @"Вес не указан";
    }
    else
    {
        self.weightLabel.text = self.offer.weight;
    }
    
    self.priceLabel.text = self.offer.price;
    
    if([self.offer.offerDescription  isEqualToString:@""])
    {
        self.decriptionLabel.text = @"Описание не указано";
    }
    else
    {
        self.decriptionLabel.text = self.offer.offerDescription;
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
