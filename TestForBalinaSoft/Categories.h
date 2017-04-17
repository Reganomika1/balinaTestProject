//
//  Categories.h
//  TestForBalinaSoft
//
//  Created by Admin on 13.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBase.h"
#import "Offers.h"

#define CategoriesCellIdentifier @"CategoryCell"

@class Category;

@interface Categories : UITableViewController <NSXMLParserDelegate>
{
    UIProgressView *_myProgress;
    
    NSTimer *_myTimer;
}



@end
