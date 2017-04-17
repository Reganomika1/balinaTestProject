//
//  Contacts.m
//  TestForBalinaSoft
//
//  Created by Admin on 17.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Contacts.h"

@interface Contacts ()

@end

@implementation Contacts

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.tableData = [NSMutableArray array];
    }
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Контакты";
    
    Contact *_contactKurk = [[Contact alloc] initWithAdress:@"Курская обл. г. Курск, ул. Сумская д.5"
                                               phoneNumber:@"+7 (4712) 747111"
                                               andLocation: CLLocationCoordinate2DMake(51.706921f, 36.162023f)];
    
    Contact *_contactOmsk = [[Contact alloc] initWithAdress:@"г. Омск, ул. Куйбышева, д. 132"
                                                phoneNumber:@"+7 (3812) 378-111"
                                                andLocation: CLLocationCoordinate2DMake(54.977175f, 73.397425f)];
    
    [self.tableData addObject:_contactKurk];
    
    [self.tableData addObject:_contactOmsk];
    
    /*
     
     Я добавил только два ресторана на карту, потому что я посмотрел что их там очень много и все добавлять будет долго,
     но при необходимости могу спокойно добавить все остальные.
     
     */
}



#pragma mark - TableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *_cell = [self.tableView dequeueReusableCellWithIdentifier:ContactsCellIdentifier];
    
    if (!_cell)
    {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ContactsCellIdentifier];
        
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Contact *_tmpContact =  [self.tableData objectAtIndex:indexPath.row];
    
    _cell.textLabel.text = _tmpContact.adress;
    
    _cell.detailTextLabel.text = _tmpContact.phoneNumber;
    
    return _cell;
}



#pragma mark - TableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *_tmpContact = [self.tableData objectAtIndex:indexPath.row];
    
    Annotation *_annotation = [[Annotation alloc] init];
    
    _annotation.title = @"Доставка «Фарфор»";
    
    _annotation.subtitle = _tmpContact.adress;
    
    _annotation.coordinate = _tmpContact.location;
    
    MapVC *_mapVC = [[MapVC alloc] initWithAnnotation:_annotation];
    
    [self.navigationController pushViewController:_mapVC animated:YES];
}



#pragma mark - User functions - 

- (void) addContact:(Contact *) contact
{
    [self.tableData addObject:contact];
}


@end
