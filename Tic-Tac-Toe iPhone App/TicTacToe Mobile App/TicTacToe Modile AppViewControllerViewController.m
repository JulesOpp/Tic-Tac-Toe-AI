//
//  TicTacToe Modile AppViewControllerViewController.m
//  TicTacToe Mobile App
//
//  Created by Jules on 9/5/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "TicTacToe Modile AppViewControllerViewController.h"

@interface TicTacToe_Modile_AppViewControllerViewController ()

@end

@implementation TicTacToe_Modile_AppViewControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
