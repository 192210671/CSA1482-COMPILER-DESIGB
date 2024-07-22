%{
#include <stdio.h>
%}

%%

[A-Z]+      { printf("Capital word found: %s\n", yytext); }

.|\n        { /* Ignore other characters */ }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}
