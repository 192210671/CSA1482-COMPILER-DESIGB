%{
#include <stdio.h>
%}

%%

[7-9][0-9]{9}	{ printf("Valid mobile number: %s\n",yytext); }
[0-9]{10}	{ printf("Invalid mobile Number:%s\n",yytext); }
[^0-9\n]+	{ /* Ignore non-numeric input */ }
\n		{ /* Ignore newline */ }

%%

int main(void)
 {
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
