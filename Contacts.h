//
//  Contacts.h
//  TestForBalinaSoft
//
//  Created by Admin on 17.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "Annotation.h"
#import "MapVC.h"

#define ContactsCellIdentifier @"ContactCell"

@interface Contacts : UITableViewController

@property (strong, nonatomic) NSMutableArray *tableData;

- (void) addContact:(Contact *) contact;


@end
