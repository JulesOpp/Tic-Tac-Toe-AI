//
//  AppViewController.h
//  TicTacToe Mobile App
//
//  Created by Jules on 9/5/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define INGAME 0
#define OUTGAME 1
#define TWOPLAYER 0
#define ONEPLAYER 1
#define PLAYERONE 'X'
#define PLAYERTWO 'O'

@interface AppViewController : UIViewController
{
    IBOutlet UILabel * myLabel;
    IBOutlet UIButton * button1;
    IBOutlet UIButton * button2;
    IBOutlet UIButton * button3;
    IBOutlet UIButton * button4;
    IBOutlet UIButton * button5;
    IBOutlet UIButton * button6;
    IBOutlet UIButton * button7;
    IBOutlet UIButton * button8;
    IBOutlet UIButton * button9;
}

- (int)CheckTwo: (int)one: (int)two: (int)three;
- (void)AIMove;
- (int)CheckBoard;

- (IBAction)buttonReset:(id)sender;
- (IBAction)gameMode:(id)sender;


@end
