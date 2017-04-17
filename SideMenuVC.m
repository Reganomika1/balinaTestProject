//
//  LeftMenuTVC.m
//  testProject
//
//  Created by artur on 2/14/14.
//  Copyright (c) 2014 artur. All rights reserved.
//

#import "SideMenuVC.h"

@interface SideMenuVC ()

@end

@implementation SideMenuVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableData = [@[@"Каталог", @"Контакты"] mutableCopy];
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
    UITableViewCell *_cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!_cell)
    {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    _cell.textLabel.text = self.tableData[indexPath.row];
    
    return _cell;
}



#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *_rootVC;
    
    switch (indexPath.row)
    {
        case 0:
        {
            _rootVC = [[Categories alloc] init];
        }
            break;
        case 1:
        {
            _rootVC = [[Contacts alloc] init];
        }
            break;
            
        default:
            break;
    }
    
    UINavigationController *_nvc = [[UINavigationController alloc] initWithRootViewController:_rootVC];
    
    [self openContentNavigationController:_nvc];
}


@end
