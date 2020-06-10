#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>

char c[9];

 void itob(int i){
    char bits[9] = {'0','0','0','0','0','0','0','0','\0'};
    int bits_index = 7;
    while ( i > 0 ) {
        bits[bits_index--] = (i & 1) + '0';
        i = ( i >> 1);
    }
    strcpy(c,bits);
}


int main()
{
    char s[20];
    FILE *fptr = fopen("memfile.dat", "w");
    printf("\t \t \tWelcome to Custom CPU compiler\n\n\nEnter code to compile:\n--------------------------------------------------------------\n\n");
    while(strlen(gets(s))>0){
        fflush(stdin);
        char bits[16]="0000000000000000";
        char X[5]={s[0],s[1],s[2],s[3],'\0'};
        int ins=-1;

        if(strcmp(X,"add ")==0){
            ins =1;
        }
        else if(strcmp(X,"sub ")==0){
            ins =2;
        }
        else if(strcmp(X,"and ")==0){
			ins =3;
        }
        else if(strcmp(X,"or $")==0){
            ins =4;
        }
        else if(strcmp(X,"addi")==0){
            ins =5;
        }
        else if(strcmp(X,"lw  ")==0){
			ins =6;
        }
		else if(strcmp(X,"sw  ")==0){
            ins =7;
        }
		else if(strcmp(X,"beq ")==0){
            ins =8;
        }
		else if(strcmp(X,"j   ")==0){
            ins =9;
        }
        else{
            ins=0;
        }
        switch (ins){
            case 1: //printf("Got add instruction\n");
                itob(s[5]-48);
                bits[9]=c[7];
                bits[10]=c[6];
                bits[11]=c[5];

                itob(s[8]-48);
                bits[6]=c[7];
                bits[7]=c[6];
                bits[8]=c[5];

                itob(s[11]-48);
                bits[3]=c[7];
                bits[4]=c[6];
                bits[5]=c[5];

                bits[1]='0';
                break;
            case 2: //printf("Got sub instruction \n");
                itob(s[5]-48);
                bits[9]=c[7];
                bits[10]=c[6];
                bits[11]=c[5];

                itob(s[8]-48);
                bits[6]=c[7];
                bits[7]=c[6];
                bits[8]=c[5];

                itob(s[11]-48);
                bits[3]=c[7];
                bits[4]=c[6];
                bits[5]=c[5];
                bits[1]='1';
                break;
            case 3: //printf("Got and instruction");
                bits[2]='1';
                itob(s[5]-48);
             // printf("%s",c);
                bits[9]=c[7];
                bits[10]=c[6];
                bits[11]=c[5];

                itob(s[8]-48);
                bits[6]=c[7];
                bits[7]=c[6];
                bits[8]=c[5];

                itob(s[11]-48);
                bits[3]=c[7];
                bits[4]=c[6];
                bits[5]=c[5];
                break;
            case 4:  //printf("Got or instruction");
                bits[2]='1';
                bits[0]='1';

                itob(s[4]-48);
                bits[9]=c[7];
                bits[10]=c[6];
                bits[11]=c[5];

                itob(s[7]-48);
                bits[6]=c[7];
                bits[7]=c[6];
                bits[8]=c[5];

                itob(s[10]-48);
                bits[3]=c[7];
                bits[4]=c[6];
                bits[5]=c[5];
                break;
            case 5: printf("Got addi instruction");
                break;
            case 6: printf("Got lw instruction");
                break;
            case 7: printf("Got sw instruction");
                break;
            case 8: printf("Got beq instruction");
                break;
            case 9: printf("Got j instruction");
                break;
            default: printf("Invalid command");
                break;
        }
        int y;
        for(y=0;y<=7;y++){
  	     	int temp;
  	     	temp=bits[y];
  	     	bits[y]=bits[15-y];
  	     	bits[15-y]=temp;
        }
        bits[16]='\0';
  		fputs(bits, fptr);
        fputs("\n",fptr);
    }
    fclose(fptr);
    printf("\n--------------------------------------------------------------\n\nNow check out the output:\n\n--------------------------------------------------------------\n\n");
    system("iverilog -o cpu.vvp cpu.v pc.v mux8bit21.v mux3bit21.v dc1.v datamemory.v CU.v bitextender.v ALU.v ir.v adrsExtend.v regfile.v imem.v");
    system("vvp cpu.vvp");
    printf("\n\n--------------------------------------------------------------\n\nExecution terminated. Press any key to Exit...");
    getch();
}
