%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
([0-2][0-9]|(3)[0-1])\/(0[1-9]|1[0-2])\/([0-9]{4}) { printf("Valid DOB: %s\n", yytext); }
.|\n { printf("Invalid DOB: %s\n", yytext); }

%%

// driver program 
int main()  
{ 
    printf("Enter DOB: "); 
    yylex(); 
    return 0;
} 

int yywrap()
{
    return 1;
}
