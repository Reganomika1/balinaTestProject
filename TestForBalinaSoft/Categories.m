//
//  Categories.m
//  TestForBalinaSoft
//
//  Created by Admin on 13.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Categories.h"

@interface Categories ()

@end

@implementation Categories



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if([[DataBase sharedInstance].categories count] == 0)
    {
        _myProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    
        _myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                    target:self
                                                    selector:@selector(changProgress)
                                                    userInfo:nil
                                                    repeats:YES];

        self.tableView.tableHeaderView = _myProgress;

        self.title = @"Идет загрузка данных";
    }
    else
    {
        self.title = @"Каталог";
    }
}


- (void)changProgress
{
    _myProgress.progress = _myProgress.progress + 0.1f;
    
    if (_myProgress.progress == 1.0f)
    {
        [_myTimer invalidate];
        
        [ self.tableView reloadData];
        
        self.title = @"Каталог";
        
        self.tableView.tableHeaderView = nil;
    }
}



#pragma mark - TableViewDataSource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [DataBase sharedInstance].categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *_cell = [tableView dequeueReusableCellWithIdentifier:CategoriesCellIdentifier];
    
    if(_cell == nil)
    {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                        reuseIdentifier:CategoriesCellIdentifier];
        
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Category *_tmpCategory = [[Category alloc] init];
    
    _tmpCategory = [[DataBase sharedInstance].categories objectAtIndex:indexPath.row];
    
    _cell.textLabel.text = _tmpCategory.name;
    
    _cell.imageView.image = [UIImage imageWithContentsOfFile:_tmpCategory.imageName];
    
    return _cell;
}



#pragma mark - TableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Category *_tmpCategory = [[DataBase sharedInstance].categories objectAtIndex:indexPath.row];
    
    Offers *_offercVC = [[Offers alloc] initWithOffers:_tmpCategory.offers];
    
    [self.navigationController pushViewController:_offercVC animated:YES];
}


@end
