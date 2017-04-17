//
//  Offers.m
//  TestForBalinaSoft
//
//  Created by Admin on 15.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Offers.h"

@interface Offers ()

@end

@implementation Offers

- (instancetype)initWithOffers:(NSArray *) offers
{
    self = [super init];
    
    if (self)
    {
        self.offers = [[NSArray alloc] initWithArray:offers];
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Блюда";

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.offers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *_cell = [tableView dequeueReusableCellWithIdentifier:OCellIdentifier];
    
    if(_cell == nil)
    {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:OCellIdentifier];
        
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Offer *_tmpOffer =  [self.offers objectAtIndex:indexPath.row];
    
    if([_tmpOffer.imageUrl isEqualToString:@""])
    {
        _cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"no_photo" ofType:@".png"]];
    }
    else
    {
        [_cell.imageView sd_setImageWithURL:[NSURL URLWithString:_tmpOffer.imageUrl]
                           placeholderImage:[UIImage imageNamed:@"no_photo.png"]];
    }
    
    _cell.textLabel.text = _tmpOffer.name;
    
    if(_tmpOffer.weight == nil)
    {
        _cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _tmpOffer.price];
    }
    else
    {
        _cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  %@", _tmpOffer.price, _tmpOffer.weight];
    }
    
    
    return _cell;
}



#pragma mark - TableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Offer *_tmpOffer =  [self.offers objectAtIndex:indexPath.row];
    
    OfferDescription *_offerDescVC = [[OfferDescription alloc] initWithOffer:_tmpOffer];
    
    [self.navigationController pushViewController:_offerDescVC animated:YES];
}


@end
