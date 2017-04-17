//
//  MainViewController.m
//  TestForBalinaSoft
//
//  Created by Admin on 16.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    self.leftMenu = [[SideMenuVC alloc] initWithNibName:@"SideMenuVC" bundle:nil];

    [super viewDidLoad];
}



#pragma mark - Overriding methods

- (void)configureLeftMenuButton:(UIButton *)button
{
    CGRect _frame = button.frame;
    
    _frame.origin = (CGPoint){0,0};
    
    _frame.size = (CGSize){40,40};
    
    button.frame = _frame;
    
    [button setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
}


- (BOOL)deepnessForLeftMenu
{
    return YES;
}


@end
