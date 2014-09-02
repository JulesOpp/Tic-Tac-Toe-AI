#include <iostream>
#include <time.h>

int CheckBoard(char board[], char player);
int AIMove(char board[], char player);
int CheckTwo(char board[], char player, int one, int two, int three);

int main(int argc, const char * argv[]) {
    srand(time(NULL));
    printf("Welcome To TicTacToe!\n");
    char board[] =   {' ',' ',' ',' ',' ',' ',' ',' ',' '};
    int input, player = 0, win = 0;
    for(int i=0;i<3;i++) (i!=2)?printf(" %c | %c | %c \n-----------\n",board[i*3],board[i*3+1],board[i*3+2]):printf(" %c | %c | %c \n",board[i*3],board[i*3+1],board[i*3+2]);
    while (!win) {
        printf("\nPlayer %i,enter position (1-9)\n",player);
        if (player == 0) do input=getchar()-'0'-1-0*getchar(); while (board[input]!=' '||input>=9||input<0);
        else  input = AIMove(board, 'X');     
        board[input] = (player==0)?'O':'X';    
        for(int i=0;i<3;i++) (i!=2)?printf(" %c | %c | %c \n-----------\n",board[i*3],board[i*3+1],board[i*3+2]):printf(" %c | %c | %c \n",board[i*3],board[i*3+1],board[i*3+2]);
        player ^= 1;      
        win = CheckBoard(board, 'O');               
    }
    (win==1)?printf("Player 1 wins!!"):((win==2)?printf("Player 2 wins!!"):printf("Tie!!"));
    return 0;
}

int CheckTwo(char board[], char player, int one, int two, int three) {
    if (board[one]==player&&board[two]==player&&board[three]==' ') return three;
    else if (three < one && three < two) return -1;
    else return CheckTwo(board, player, three, one, two);
}

int AIMove(char board[], char player) {
    int check;
    for (int k=0;k<2;k++) {
        for(int i=0;i<3;i++) {
            check = CheckTwo(board, player, i*3, i*3+1, i*3+2);
            if (check != -1) return check;
            check = CheckTwo(board, player, i, i+3, i+6);
            if (check != -1) return check;
        }
        check = CheckTwo(board, player, 0, 4, 8);
        if (check != -1) return check;
        check = CheckTwo(board, player, 2, 4, 6);
        if (check != -1) return check;
        player = (player=='O')?'X':'O';
    }
    do check = rand() % 10; while (board[check] != ' ');
    return check;
}

int CheckBoard(char board[], char player) {    
    for(int j=1;j<3;j++) {
        for(int i=0;i<3;i++) {
            if (board[i*3]==player&&board[i*3+1]==player&&board[i*3+2]==player) return j;
            if (board[i]==player&&board[i+3]==player&&board[i+6]==player)       return j;
        }
        if (board[0]==player&&board[4]==player&&board[8]==player) return j;
        if (board[2]==player&&board[4]==player&&board[6]==player) return j;
        player = 'X';
    }
    for (int i=0; i<9; i++) if (board[i] == ' ') return 0;
    return 3;
}