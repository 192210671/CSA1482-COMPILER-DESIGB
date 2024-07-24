%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

abc { printf("ABC"); }
.|\n { printf("%s", yytext); }

%%

int main()  
{ 
    yylex(); 
    return 0;
} 

int yywrap()
{
    return 1;
}
