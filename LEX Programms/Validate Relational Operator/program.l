%{
#include <stdio.h>
#include <stdlib.h>
%}


%%

[a-zA-z]+	{ printf("Word:%s\n",yytext); }
"=="|"!="|"<="|">="|"<"|">"	{ printf("Relational Operator:%s\n",yytext); }
.|\n  { /* ignore other characters */ }

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
