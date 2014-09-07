#import "AppViewController.h"

char board[] =   {' ',' ',' ',' ',' ',' ',' ',' ',' '};
char play = PLAYERONE;
int state = INGAME, mode = TWOPLAYER, turn = 0, check;
NSArray *buttonArray;

@implementation AppViewController
- (int)CheckTwo: (int)one: (int)two: (int)three {
    if (board[one]==play&&board[two]==play&&board[three]==' ') return three;
    else if (three < one && three < two) return -1;
    return [self CheckTwo:three: one: two];
}

- (void) AIMove {
    if (turn == 0 && board[4] == ' ') { check = 4; goto abc; }
    else if(turn == 0 && board[4] != ' ') {
        do { check = rand() % 4; 
            check = (int)(-2.0/3*pow(check, 3) + 3*pow(check, 2) - check/3.0);
        } while (board[check] != ' ');
        goto abc;
    }
    else if(turn==1&&board[4]==PLAYERTWO&&((board[0]==PLAYERONE&&board[8]==PLAYERONE)||(board[2]==PLAYERONE&&board[6]==PLAYERONE))) {
        do check = 2*(rand() % 4)+1; while (board[check] != ' '); 
        goto abc;
    }
    else if(turn==1&&board[4]==PLAYERONE&&((board[0]!=' '&&board[8]!=' ')||(board[2]!=' '&&board[6]!=' '))) {
        do check = (rand()%2==0)?((board[0]!=' ')?2:0):(board[0]!=' ')?6:8; while (board[check] != ' ');
        goto abc;
    }
    for (int k=0;k<2;k++) {
        for(int i=0;i<3;i++) {
            check = [self CheckTwo:i*3: i*3+1: i*3+2]; if (check != -1) goto abc;
            check = [self CheckTwo: i: i+3: i+6]; if (check != -1) goto abc;
        }
        check = [self CheckTwo: 0: 4: 8]; if (check != -1) goto abc;
        check = [self CheckTwo: 2: 4: 6]; if (check != -1) goto abc;
        play = (play==PLAYERTWO)?PLAYERONE:PLAYERTWO;
    }
    do check = rand() % 9; while (board[check] != ' ');
abc:[[buttonArray objectAtIndex:check] setTitle:@"O" forState:UIControlStateNormal];
    board[check] = PLAYERTWO, play = PLAYERONE, turn++;
}

- (IBAction)gameMode:(id)sender {
    for (int i=0; i<9; i++) {
        board[i] = ' ';   
        [[buttonArray objectAtIndex:i] setTitle:@"" forState:UIControlStateNormal];
    }
    state = INGAME, play = PLAYERONE, turn = 0, mode ^= 1;
    (mode==TWOPLAYER)?[myLabel setText:@"Game Mode: 1v1"]:[myLabel setText:@"Game Mode: AI"];
}

- (IBAction)buttonReset:(id)sender {
    for (int i=0; i<9; i++) {
        board[i] = ' ';   
        [[buttonArray objectAtIndex:i] setTitle:@"" forState:UIControlStateNormal];
    }
    [myLabel setText:@""];
    state = INGAME, play = PLAYERONE, turn = 0;
}

- (int)CheckBoard {   
    char player = PLAYERONE, check = 3;
    for(int j=1;j<3;j++) {
        for(int i=0;i<3;i++) {
            if (board[i*3]==player&&board[i*3+1]==player&&board[i*3+2]==player) {check = j; goto cde; }
            if (board[i]==player&&board[i+3]==player&&board[i+6]==player) {check = j; goto cde; }
        }
        if (board[0]==player&&board[4]==player&&board[8]==player) {check = j; goto cde;}
        if (board[2]==player&&board[4]==player&&board[6]==player) {check = j; goto cde;}
        player = PLAYERTWO;
    }
    for (int i=0; i<9; i++) if (board[i] == ' ') {check = 0; goto cde;}
cde:if (check == 0) return 0;
    [myLabel setText:(check==1)?@"Player 1 wins!!":((check==2)?@"Player 2 wins!!":@"Tie!!")];
    state = OUTGAME;
    return 1;
}

- (IBAction)buttonMulPress:(id)sender {
    for (int i=0;i<9;i++) if (sender == [buttonArray objectAtIndex:i]) check = i;
    if (board[check] != ' ' || state == OUTGAME) return;
    [sender setTitle:[NSString stringWithFormat:@"%c",play] forState:UIControlStateNormal];
    board[check] = play;
    play = (play==PLAYERONE)?PLAYERTWO:PLAYERONE;
    if ([self CheckBoard] == 0 && mode == ONEPLAYER) { [self AIMove]; [self CheckBoard]; }
}

- (void)viewDidLoad { 
    [super viewDidLoad];     
    buttonArray = [[NSArray alloc] initWithObjects:button1,button2,button3,button4,button5,button6,button7,button8,button9,nil];
    srand([[NSDate date] timeIntervalSince1970]);
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil { return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]; }
- (void)viewDidUnload { [super viewDidUnload]; }
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{ return (interfaceOrientation == UIInterfaceOrientationPortrait); }
@end