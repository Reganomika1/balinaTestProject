//
//  SideMenuVC.h
//  TestForBalinaSoft
//
//  Created by Admin on 16.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "AMSlideMenuLeftTableViewController.h"
#import "Categories.h"
#import "Contacts.h"

@interface SideMenuVC : AMSlideMenuLeftTableViewController

@property (strong, nonatomic) IBOutlet UITableView *menuView;
@property (strong, nonatomic) NSMutableArray *tableData;


@end
