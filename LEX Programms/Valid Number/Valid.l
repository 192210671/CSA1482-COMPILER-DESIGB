%{
#include <stdio.h>
%}

%%

[0-9]    { printf("The input is a digit.\n"); }
.        { printf("The input is not a digit.\n"); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
